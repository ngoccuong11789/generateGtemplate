import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/checkout/model/city_model.dart';
import 'package:shared_module/features/checkout/model/countries.dart';
import 'package:shared_module/features/checkout/model/district_model.dart';
import 'package:shared_module/utils/package_util.dart';

class SelectDropDownDistrict extends StatefulWidget {
  final Function(ItemDistrict) onGetDistrict;
  final List<ItemDistrict> district;
  const SelectDropDownDistrict({super.key, required this.district, required this.onGetDistrict});

  @override
  State<SelectDropDownDistrict> createState() => _SelectDropDownDistrictState();
}

class _SelectDropDownDistrictState extends State<SelectDropDownDistrict> {
  ItemDistrict _selected = ItemDistrict();

  void showModal(context, List<ItemDistrict> list) {
    var lineTop = Container(
      width: 36,
      height: 5,
      decoration: ShapeDecoration(
        color: const Color(0x4C3C3C43),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.50),
        ),
      ),
    );
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10.0,),
                  lineTop,
                  ...list.asMap().entries.map((e) {
                    var index = e.key;
                    var value = e.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = list[index];
                        });
                        widget.onGetDistrict(_selected);
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value.districtName ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1,
                              color: ColorPalette.gray200,
                            )
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            )
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            widget.district.isNotEmpty ? showModal(context, widget.district ?? []) : ();
          },
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFCFD4DC)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 24,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selected.districtName ?? '',
                          style: const TextStyle(
                            color: Color(0xFF667084),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                    width: 20,
                    height: 20,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child:
                    package.createSvgFromAsset(AssetHelper.downChevron)),
              ],
            ),
          ),
        ));
  }
}
