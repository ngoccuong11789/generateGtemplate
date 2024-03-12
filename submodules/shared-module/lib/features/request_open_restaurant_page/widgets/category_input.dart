import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:provider/provider.dart';
import 'package:shared_module/features/request_open_restaurant_page/model/category_restaurant.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;
import 'package:shared_module/features/request_open_restaurant_page/bloc/request_to_open_restaurant_bloc.dart';
import 'package:shared_module/features/request_open_restaurant_page/widgets/bottom_action_bar.dart';

import '../../../localization/shared_localizations.dart';

class CategoryInput extends StatefulWidget {
  const CategoryInput({
    super.key,
  });

  @override
  State<CategoryInput> createState() => _CategoryInputState();
}

class _CategoryInputState extends State<CategoryInput> {

  bool containsTrue(List<bool> list) {
    for (var element in list) {
      if (element == true) {
        return true;
      }
    }
    return false;
  }
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<RequestToOpenRestaurantBloc>(context).add(const HandleGetListCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RequestToOpenRestaurantBloc requestToOpenRestaurantBloc =
        Provider.of<RequestToOpenRestaurantBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          SharedLocalizations.of(context)!.categoryType,
          style: const TextStyle(
            color: Color(0xFF344053),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: ColorPalette.baseWhite,
              isScrollControlled: true,
              context: context,
              builder: (context) => BlocBuilder<RequestToOpenRestaurantBloc,
                  RequestToOpenRestaurantState>(
                bloc: requestToOpenRestaurantBloc,
                builder: (context, state) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        const _DragBar(),
                        const SizedBox(height: 8),
                        _Title(title: SharedLocalizations.of(context)!.category),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: state.selectCategory.categoryList.asMap().entries.map((e) {
                              final index = e.key;
                              final category = e.value;
                              return Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Checkbox(
                                    side: const BorderSide(width: 0.5),
                                    activeColor: ColorPalette.bluePrimary,
                                    value: state.selectCategory.indexList[index],
                                    onChanged: (newValue) {
                                      requestToOpenRestaurantBloc.add(ChangeCategory(index: index));
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      requestToOpenRestaurantBloc.add(ChangeCategory(index: index));
                                    },
                                    child: Text(
                                      category.name ?? "",
                                      style: const TextStyle(
                                        color: Color(0xFF344053),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                        BottomActionBar(
                          text: SharedLocalizations.of(context)!.save,
                          onPressed: () => Navigator.pop(context),
                          controller:
                              containsTrue(state.selectCategory.indexList),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 44,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                borderRadius: BorderRadius.circular(8)),
            child: BlocBuilder<RequestToOpenRestaurantBloc,
                RequestToOpenRestaurantState>(
              bloc: requestToOpenRestaurantBloc,
              builder: (context, state) {
                List<Category> chosenCategory =
                    requestToOpenRestaurantBloc.getChosenCategory();
                return containsTrue(state.selectCategory.indexList)
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: chosenCategory.asMap().entries.map((e) {
                            var index = e.key;
                            var value = e.value;
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 9, right: 4, top: 2, bottom: 2),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFF2F4F7),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(9999),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          chosenCategory[index].name ?? "",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Color(0xFF344053),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        GestureDetector(
                                          onTap: () => requestToOpenRestaurantBloc.add(DeleteCategory(category: value)),
                                          child: const icon.SoctripIcon(
                                            icon.Icons.xClose,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                              ],
                            );
                          }).toList(),
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                SharedLocalizations.of(context)!.category,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Container(
                                width: 20,
                                height: 20,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child:
                                package.createSvgFromAsset(AssetHelper.downChevron)),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF101828),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 0.09,
        ),
      ),
      trailing: GestureDetector(
        child: const icon.SoctripIcon(icon.Icons.xClose),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}

class _DragBar extends StatelessWidget {
  const _DragBar();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 32,
        height: 4,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: ColorPalette.gray300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
