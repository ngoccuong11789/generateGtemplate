import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';

class ShowModal{
  static void modal ({required BuildContext context, required Widget bodyModal}){
     showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        isDismissible: true,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
              child: Wrap(
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: ColorPalette.baseWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 12, bottom: 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 5,
                                      decoration: ShapeDecoration(
                                        color: const Color(0x4C3C3C43),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.50),
                                        ),
                                      ),
                                    ),
                                    bodyModal,
                                  ],
                                ),
                              )]
                        )
                    )
                  ]));
        });
  }
}