import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/search_term/bloc/search_page_bloc.dart';
import 'package:shared_module/common_widgets/search_term/bloc/search_page_state.dart';
import 'package:shared_module/common_widgets/search_term/filter_common/_components/wrap_conent.dart';
import 'package:shared_module/common_widgets/search_term/filter_common/model/TypeSectionEnum.dart';
import 'package:shared_module/common_widgets/search_term/model/FilterModel.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/localization/localizations.dart';
import '../model/FieldNameFilter.dart';
import '_components/_section.dart';
import 'model/item_filter_content.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class FilterWidget extends StatefulWidget {
  const FilterWidget(
      {super.key,
      required this.service,
      required this.foodCatalog, required this.fieldNameFilter});

  final List<ItemFilterContent> service;
  final List<ItemFilterContent>? foodCatalog;
  final FieldNameFilter fieldNameFilter;
  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool showAllCatalog = false;
  bool showAllRegions = false;
  bool showAllRating = false;
  bool showAllFoodCatalog = false;

  @override
  Widget build(BuildContext context) {
    String symbol = SharedLocalizations.of(context)!.currencySymbol("USD");
    return BlocBuilder<SearchPageBloc, SearchPageState>(
      builder: (context, state) {
        Widget _textField(TextEditingController controller, String hintText) {
          final focusNode = FocusNode();
          return SizedBox(
            height: 40,
            child: TextField(
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorPalette.gray900),
                controller: controller,
               onTapOutside: (e){
                  focusNode.unfocus();
               },
                focusNode: focusNode,
                keyboardType: TextInputType.phone,
                textAlignVertical: TextAlignVertical.center,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: ColorPalette.grey400,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: ColorPalette.redPrice, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: ColorPalette.grey400, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                )),
          );
        }
        List<ItemFilterContent> catalogs =
            state.filterValue.selectCatalogs.map((e) => e).toList();
        List<ItemFilterContent> regions =
            state.filterValue.selectRegions.map((e) => e).toList();
        List<ItemFilterContent> service =
            state.filterValue.service.map((e) => e).toList();
        List<ItemFilterContent> selectFoodCatalogs =
            state.filterValue.selectFoodCatalogs.map((e) => e).toList();
        FilterModel filter = FilterModel(
                selectRegions: regions,
                selectCatalogs: catalogs,
                rating: state.filterValue.rating,
                sort: state.filterValue.sort,
                maxPrice: TextEditingController(
                    text: state.filterValue.maxPrice.text),
                minPrice: TextEditingController(
                    text: state.filterValue.minPrice.text),
                searchTerm: TextEditingController(
                    text: state.filterValue.searchTerm.text),
                service: service,
                selectFoodCatalogs: selectFoodCatalogs,
                discountPercent: state.filterValue.discountPercent,
                quick: state.filterValue.quick)
            .copyWith(selectCatalogs: state.filterValue.selectCatalogs);
        Widget serviceWidget = StatefulBuilder(
          builder: (_, void Function(void Function()) setState) {
            return Wrap(
                runSpacing: 4,
                spacing: 4,
                alignment: WrapAlignment.start,
                children: widget.service
                    .map((e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              List<ItemFilterContent> service =
                                  filter.service.map((e) => e).toList() ?? [];
                              if (service.contains(e)) {
                                service.remove(e);
                              } else {
                                service.add(e);
                              }
                              filter = filter.copyWith(service: service);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: (filter.service.contains(e) ?? false)
                                        ? ColorPalette.primary600
                                        : ColorPalette.grey200,
                                    width: 1)),
                            child: Text(
                              e.content,
                              style: TextStyle(
                                  color: filter.service.contains(e)
                                      ? ColorPalette.primary600
                                      : ColorPalette.gray500,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              maxLines: 1,
                            ),
                          ),
                        ))
                    .toList());
          },
        );

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.only(top: 40, bottom: 12),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: ColorPalette.gray300, width: 0.5))),
                  child: Text(
                    SharedLocalizations.of(context)!.filter,
                    style: const TextStyle(
                        color: ColorPalette.gray800,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    children: [

                      //region
                      StatefulBuilder(
                        builder: (_, void Function(void Function()) setState) {
                          return SectionWidget(
                            content: SharedLocalizations.of(context)!.region,
                            onTap: state.regions.length > 8
                                ? () {
                              setState(() {
                                showAllRegions = !showAllRegions;
                              });
                            }
                                : null,
                            status: showAllRegions,
                            child: WrapContentWidget(
                              data: showAllRegions
                                  ? state.regions
                                  : state.regions.take(8).toList(),
                              dataSelect: filter.selectRegions,
                              onTapItem: (ItemFilterContent itemFilterContent) {
                                setState(() {
                                  List<ItemFilterContent> regions = filter
                                      .selectRegions
                                      .map((e) => e)
                                      .toList();
                                  if (regions.contains(itemFilterContent)) {
                                    regions.remove(itemFilterContent);
                                  } else {
                                    regions.add(itemFilterContent);
                                  }
                                  filter =
                                      filter.copyWith(selectRegions: regions);
                                });
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //price
                      (widget.fieldNameFilter.price != null)
                          ? Column(
                              children: [
                                SectionWidget(
                                  content: SharedLocalizations.of(context)!
                                      .priceRange,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: _textField(filter.minPrice,
                                              "${SharedLocalizations.of(context)!.min} ($symbol)")),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        "-",
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: _textField(filter.maxPrice,
                                              "${SharedLocalizations.of(context)!.max} ($symbol)")),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                          : Container(),
                      //rating
                      StatefulBuilder(
                        builder: (_, void Function(void Function()) setState) {
                          return SectionWidget(
                              content: SharedLocalizations.of(context)!.rating,
                              child: Wrap(
                                  runSpacing: 4,
                                  spacing: 4,
                                  alignment: WrapAlignment.start,
                                  children:( [5, 4, 3, 2, 1])
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                filter = filter.copyWith(
                                                    rating: e == filter.rating
                                                        ? 0
                                                        : e);
                                              });
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 6),
                                              constraints: const BoxConstraints(
                                                  maxWidth: 50),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: e == filter.rating
                                                          ? ColorPalette
                                                              .primary600
                                                          : ColorPalette
                                                              .grey200,
                                                      width: 1)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    e.toString(),
                                                    style: TextStyle(
                                                        color:
                                                            e == filter.rating
                                                                ? ColorPalette
                                                                    .primary600
                                                                : ColorPalette
                                                                    .gray500,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  icon.SoctripIcon(icon.Icons.solidStar01,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.yellow.shade600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))
                                      .toList()));
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //catalog
                      StatefulBuilder(
                        builder: (_, void Function(void Function()) setState) {
                          return SectionWidget(
                            content: !(widget.foodCatalog  != null)
                                ? SharedLocalizations.of(context)!
                                .productCategory
                                : SharedLocalizations.of(context)!
                                .restaurantCategory,
                            onTap: state.catalogs.length > 8
                                ? () {
                              setState(() {
                                showAllCatalog = !showAllCatalog;
                              });
                            }
                                : null,
                            status: showAllCatalog,
                            child: WrapContentWidget(
                              data: showAllCatalog
                                  ? state.catalogs
                                  : state.catalogs.take(8).toList(),
                              dataSelect: filter.selectCatalogs,
                              onTapItem: (ItemFilterContent itemFilterContent) {
                                setState(() {
                                  List<ItemFilterContent> catalogs = filter
                                      .selectCatalogs
                                      .map((e) => e)
                                      .toList();
                                  if (catalogs.contains(itemFilterContent)) {
                                    catalogs.remove(itemFilterContent);
                                  } else {
                                    catalogs.add(itemFilterContent);
                                  }
                                  filter =
                                      filter.copyWith(selectCatalogs: catalogs);
                                });
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //food catalog
                      widget.foodCatalog != null
                          ? Column(
                        children: [
                          StatefulBuilder(
                            builder: (_,
                                void Function(void Function()) setState) {
                              return SectionWidget(
                                content: SharedLocalizations.of(context)!
                                    .foodCategory,
                                onTap: widget.foodCatalog!.length > 8
                                    ? () {
                                  setState(() {
                                    showAllFoodCatalog =
                                    !showAllFoodCatalog;
                                  });
                                }
                                    : null,
                                status: showAllFoodCatalog,
                                child: WrapContentWidget(
                                  data: showAllFoodCatalog
                                      ? widget.foodCatalog!
                                      : widget.foodCatalog!
                                      .take(8)
                                      .toList(),
                                  dataSelect: filter.selectFoodCatalogs,
                                  onTapItem: (ItemFilterContent
                                  itemFilterContent) {
                                    setState(() {
                                      List<ItemFilterContent> catalogs =
                                      filter.selectFoodCatalogs
                                          .map((e) => e)
                                          .toList();
                                      if (catalogs
                                          .contains(itemFilterContent)) {
                                        catalogs
                                            .remove(itemFilterContent);
                                      } else {
                                        catalogs.add(itemFilterContent);
                                      }
                                      filter = filter.copyWith(
                                          selectFoodCatalogs: catalogs);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )
                          : Container(),
                        //service
                      widget.service.isNotEmpty
                          ? Column(
                              children: [
                                SectionWidget(
                                  content:
                                      SharedLocalizations.of(context)!.service,
                                  child: serviceWidget,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                          : Container(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 16,right: 16,left: 16),
            height: 64,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: ColorPalette.gray300, width: 0.5))),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: SecondaryButton(
                        SharedLocalizations.of(context)!.reset,
                        onPressed: () {
                          context
                              .read<SearchPageBloc>()
                              .add(ResetFilter());
                          Navigator.of(context).pop();
                        })),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    flex: 5,
                    child: PrimaryButton(
                        SharedLocalizations.of(context)!.apply,
                        onPressed: () {
                          context.read<SearchPageBloc>()..add(
                              Search(
                                  searchTerm: filter))..add(GetDataForFilter(filter));
                          Navigator.of(context).pop();
                        })),
              ],
            ),
          ),
        );
      },
    );
  }
}


