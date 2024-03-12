import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/common_widgets/ListViewCustom.dart';
import 'package:shared_module/common_widgets/search_term/bloc/search_page_bloc.dart';
import 'package:shared_module/common_widgets/search_term/bloc/search_page_state.dart';
import 'package:shared_module/common_widgets/search_term/controller/search_page_controller.dart';
import 'package:shared_module/common_widgets/search_term/filter_common/filter.dart';
import 'package:shared_module/common_widgets/search_term/model/ConfigListViewModel.dart';
import 'package:shared_module/common_widgets/search_term/model/FieldNameFilter.dart';
import 'package:shared_module/common_widgets/search_term/model/FilterModel.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/search_page/bloc/SearchEvent.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/utils/ScrollController_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

import '../../../constants/AccessHelper.dart';
import '../../../constants/constants.dart';
import '../../../utils/package_util.dart';
import '../filter_common/model/item_filter_content.dart';

typedef ItemBuilder<T> = Widget Function(T itemModel);

class ShowAllPage<T> extends StatefulWidget {
  final SearchPageController controller;
  final ItemBuilder<T> itemBuilder;
  final String? label;
  final ConfigListView configListView;
  final FilterModel filterModel;
  final FieldNameFilter fieldNameFilter;
  final List<ItemFilterContent>? sort;
  final ItemFilterContent? sortBy;
  final List<ItemFilterContent>? service;
  final List<ItemFilterContent>? foodCatalog;
  final String sharedPreferencesKey;
  final String? resultFor;

  const ShowAllPage(
      {super.key,
      required this.controller,
      required this.itemBuilder,
      this.label,
      required this.configListView,
      required this.filterModel,
      required this.fieldNameFilter,
      this.sort,
      this.service,
      this.foodCatalog,
      required this.sharedPreferencesKey,
      this.sortBy,
      this.resultFor,});

  @override
  State<ShowAllPage<T>> createState() => _ShowAllPageState<T>();
}

class _ShowAllPageState<T> extends State<ShowAllPage<T>> {
  late FilterModel _filterModel;

  final GlobalKey<ScaffoldState> _innerScaffoldKey = GlobalKey<ScaffoldState>();
  Timer? _debounce;

  Future<SharedPreferences> get pref => SharedPreferences.getInstance();
  late bool searchMode;
  FocusNode focusNode = FocusNode();
  String? resultFor;
  @override
  void initState() {
    super.initState();
    _filterModel = widget.filterModel.copyWith(sort: widget.sortBy ?? widget.sort?.first);
    setState(() {
      resultFor = widget.resultFor;
      searchMode = !widget.filterModel.validate();
    });
  }

  void _openFilterDrawer() {
    _innerScaffoldKey.currentState!.openEndDrawer();
  }

  Future<List<String>> getHistory() async {
    return (await pref).getStringList(widget.sharedPreferencesKey) ?? [];
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SearchPageBloc(widget.controller,
          widget.fieldNameFilter, widget.sharedPreferencesKey)
        ..add(Search(searchTerm: _filterModel))
        ..add(GetDataForFilter(_filterModel)),
      child: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          var reComment = Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(left: 16, right: 40, top: 12, bottom: 12),
            child: FutureBuilder(
                future: getHistory(),
                builder: (context, snapshot) {
                  final data = snapshot.data?.reversed ?? [];
                  final popularData =
                      state.popularKeyword.storage.keys.take(10);
                  List<String> suggestions =
                      state.suggestion.map((e) => e).toList();
                  return ListView(
                    children: [
                      state.suggestion.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  SharedLocalizations.of(context)!.history,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: data
                                      .map((e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              resultFor = null;
                                            });
                                            FilterModel search = newFilterModel()
                                                .copyWith(searchTerm: e, sort: state.filterValue.sort);
                                            context.read<SearchPageBloc>().add(
                                                Search(
                                                    searchTerm: search,
                                                    search: e));
                                            context
                                                .read<SearchPageBloc>()
                                                .add(GetDataForFilter(search));
                                            focusNode.unfocus();
                                            setState(() {
                                              searchMode = false;
                                            });
                                          },
                                          child:
                                              searchSuggestionHistory(true, e)))
                                      .toList(),
                                ),
                                // const SizedBox(
                                //   height: 24,
                                // ),
                                // Text(
                                //   SharedLocalizations.of(context)!
                                //       .popularKeywords,
                                //   style: const TextStyle(
                                //       fontWeight: FontWeight.bold),
                                // ),
                                // const SizedBox(
                                //   height: 12,
                                // ),
                                // Wrap(
                                //   spacing: 12,
                                //   runSpacing: 12,
                                //   children: popularData
                                //       .map((e) => GestureDetector(
                                //           onTap: () {
                                //             FilterModel search = state
                                //                 .filterValue
                                //                 .copyWith(searchTerm: e);
                                //             context.read<SearchPageBloc>().add(
                                //                 Search(
                                //                     searchTerm: search,
                                //                     search: e));
                                //             context
                                //                 .read<SearchPageBloc>()
                                //                 .add(GetDataForFilter(search));
                                //             focusNode.unfocus();
                                //             setState(() {
                                //               searchMode = false;
                                //             });
                                //           },
                                //           child: searchSuggestionHistory(
                                //               false, e)))
                                //       .toList(),
                                // ),
                              ],
                            )
                          : Column(
                              children: state.suggestion
                                  .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          resultFor = null;
                                        });
                                        FilterModel search = newFilterModel()
                                            .copyWith(searchTerm: e, sort: state.filterValue.sort);
                                        context.read<SearchPageBloc>()
                                          ..add(Search(
                                              searchTerm: search, search: e))
                                          ..add(GetDataForFilter(search));
                                        focusNode.unfocus();
                                        setState(() {
                                          searchMode = false;
                                        });
                                      },
                                      child: searchSuggestionItem(e,
                                          state.filterValue.searchTerm.text)))
                                  .toList(),
                            )
                    ],
                  );
                }),
          );
          return Scaffold(
            key: _innerScaffoldKey,
            endDrawer: BlocProvider.value(
              value: BlocProvider.of<SearchPageBloc>(context),
              child: Drawer(
                shape: const BeveledRectangleBorder(),
                child: FilterWidget(
                  fieldNameFilter: widget.fieldNameFilter,
                  service: widget.service ?? [],
                  foodCatalog: widget.foodCatalog,
                ),
              ),
            ),
            appBar: MainAppBar(
              contentAppbar: SizedBox(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.start,
                    focusNode: focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    controller: state.filterValue.searchTerm,
                    readOnly: !searchMode,
                    autofocus: searchMode,
                    onTap: () {
                      if (!searchMode) {
                        setState(() {
                          searchMode = true;
                        });
                      }
                    },
                    onChanged: (String value) {
                      if (_debounce?.isActive ?? false) _debounce?.cancel();
                      _debounce = Timer(const Duration(milliseconds: 500), () {
                        context
                            .read<SearchPageBloc>()
                            .add(SearchSuggestion(value));
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        resultFor = null;
                      });
                      FilterModel search =
                          newFilterModel().copyWith(searchTerm: value, sort: state.filterValue.sort);
                      context
                          .read<SearchPageBloc>()
                          .add(Search(searchTerm: search));
                      context
                          .read<SearchPageBloc>()
                          .add(GetDataForFilter(search));
                      focusNode.unfocus();
                      setState(() {
                        searchMode = false;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: ColorPalette.gray300,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          width: 0,
                          color: ColorPalette.gray300,
                        ),
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<SearchPageBloc>()
                                        .add(ClearSearch());
                                  },
                                  child: const icon.SoctripIcon(
                                      icon.Icons.xClose)),
                            )
                          : null,
                      contentPadding: const EdgeInsets.only(top: 8),
                      prefixIcon: package.createSvgFromAsset(
                          AssetHelper.searchIcon,
                          height: 12,
                          fit: BoxFit.scaleDown),
                    ),
                  )),
              actionsExtra: [Container()],
            ),
            body: state.loadPage
                ? Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : (!searchMode
                    ? SafeArea(
                        child: Container(
                            color: ColorPalette.white0,
                            height: double.infinity,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${SharedLocalizations.of(context)!.nResult(state.searchResponse.totalElement)} ',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPalette.gray700),
                                    children: [
                                      TextSpan(
                                          text: (state.filterValue.searchTerm
                                                      .text.isNotEmpty &&
                                                  state.filterValue.searchTerm
                                                          .text !=
                                                      " ")
                                              ? state
                                                  .filterValue.searchTerm.text
                                              : resultFor == null
                                              ? SharedLocalizations.of(context)!.allProducts
                                              : widget.resultFor,
                                          style: const TextStyle(
                                              color: ColorPalette.primary)),
                                      // TextSpan(
                                      //     text: state.filterValue.searchTerm
                                      //         .text !=
                                      //         " "
                                      //         ? "${state.filterValue.searchTerm.text} "
                                      //         :  SharedLocalizations.of(context)!.allProducts,
                                      //     style: const TextStyle(
                                      //         color: ColorPalette.primary)),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    actionSearch(
                                      SharedLocalizations.of(context)!.filter,
                                      icon.Icons.filterLines,
                                      state.filterValue.onlyFilter(),
                                      () {
                                        _openFilterDrawer();
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: [
                                        const icon.SoctripIcon(
                                            icon.Icons.switchVertical01,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: ColorPalette.primary,
                                                fontWeight: FontWeight.w600)),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: state.filterValue.sort,
                                            icon: Container(),
                                            underline: null,
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                color: ColorPalette.gray700,
                                                fontWeight: FontWeight.w600),
                                            items: (widget.sort ?? [])
                                                .map((ItemFilterContent items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text(items.content,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: state.filterValue
                                                                      .sort ==
                                                                  items
                                                              ? ColorPalette
                                                                  .primary
                                                              : ColorPalette
                                                                  .gray700,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged:
                                                (ItemFilterContent? newValue) {
                                              context
                                                  .read<SearchPageBloc>()
                                                  .add(HandleTapItemInSort(
                                                      newValue!));
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller:
                                        ScrollControllerHelper().loadMore(
                                            listener: () {
                                              context
                                                  .read<SearchPageBloc>()
                                                  .add(LoadMore());
                                            },
                                            loading: state.loading),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        state.searchResponse.data.isNotEmpty
                                            ? ListViewCustom(
                                                length: state
                                                    .searchResponse.data.length,
                                                loading: state.loading,
                                                builder: (_, index) {
                                                  return widget.itemBuilder(
                                                      state.searchResponse
                                                          .data[index]);
                                                },
                                                configListView:
                                                    widget.configListView)
                                            : Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/backpack.png",
                                                        package: packageName),
                                                    const SizedBox(height: 16),
                                                    Text(
                                                      SharedLocalizations.of(
                                                              context)!
                                                          .noData,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFF0F1728),
                                                        fontSize: 16,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.09,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    : reComment),
          );
        },
      ),
    );
  }
}

Widget searchSuggestionHistory(bool? active, String value) {
  return FittedBox(
    child: Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: ColorPalette.gray100),
      child: Row(
        children: [
          active == true
              ? const icon.SoctripIcon(
                  icon.Icons.clock,
                  style: TextStyle(fontSize: 16),
                )
              : Container(),
          const SizedBox(width: 4),
          Text(value),
        ],
      ),
    ),
  );
}

Widget searchSuggestionItem(value, search) {
  return Container(
    height: 44,
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Row(
      children: [
        package.createSvgFromAsset(AssetHelper.searchIcon,
            height: 12, fit: BoxFit.scaleDown),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 8,
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
      ],
    ),
  );
}

Widget actionSearch(value, iconPath, selected, Function() onTap) =>
    GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          icon.SoctripIcon(iconPath,
              style: TextStyle(
                  fontSize: 16.0,
                  color: selected ? ColorPalette.primary : ColorPalette.gray700,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            width: 4,
          ),
          Text(value,
              style: TextStyle(
                  fontSize: 14.0,
                  color: selected ? ColorPalette.primary : ColorPalette.gray700,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
