import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/common_text_style.dart';
import 'package:shared_module/features/search_page/bloc/SearchBloc.dart';
import 'package:shared_module/features/search_page/bloc/SearchEvent.dart';
import 'package:shared_module/features/search_page/bloc/SearchState.dart';
import 'package:shared_module/features/search_page/filter/widgets/FilterGroupWidget.dart';
import 'package:shared_module/features/search_page/model/FilterModel.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.8;
    return Drawer(
      width: drawerWidth,
      child: BlocProvider.value(
        value: BlocProvider.of<SearchBloc>(context),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      FilterModel filterModelSelected = state.filterModel;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Text(
                              SharedLocalizations.of(context)!.filter,
                              style: CommonTextStyle.title,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: ColorPalette.greyBorderLine,
                          ),
                          FilterGroupWidget(
                            maxAllowed: 5,
                            data: state.ratingStars ?? [],
                            parentWidth: drawerWidth,
                            groupName: SharedLocalizations.of(context)!.rating,
                            selectedElement: filterModelSelected.rating,
                            isMulti: false,
                            isOneColumn: true,
                          ),
                          FilterGroupWidget(
                            maxAllowed: 8,
                            data: state.categories ?? [],
                            parentWidth: drawerWidth,
                            groupName:
                                SharedLocalizations.of(context)!.category,
                            selectedElement: filterModelSelected.restaurantType,
                            isOneColumn: true,
                          ),
                          FilterGroupWidget(
                            maxAllowed: 6,
                            data: state.locations ?? [],
                            parentWidth: drawerWidth,
                            groupName: SharedLocalizations.of(context)!.region,
                            selectedElement: filterModelSelected.district,
                            isOneColumn: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SecondaryButton(
                                    SharedLocalizations.of(context)!.reset,
                                    onPressed: () {
                                      context
                                          .read<SearchBloc>()
                                          .add(Filter(FilterModel(
                                            searchTerm:
                                                state.filterModel.searchTerm,
                                            district: [],
                                            restaurantType: [],
                                            rating: [],
                                            isFilter: false,
                                          )));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: PrimaryButton(
                                    SharedLocalizations.of(context)!.apply,
                                    onPressed: () {
                                      context.read<SearchBloc>().add(Filter(
                                          filterModelSelected.copyWith(
                                              isFilter: true)));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  )),
            );
          },
        ),
      ),
    );
  }
}
