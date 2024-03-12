import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/custom_bottom_sheet.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectPlatformBottomSheet extends StatefulWidget {
  SelectPlatformBottomSheet({super.key, required this.value});
  PlatformEnum? value;
  @override
  State<SelectPlatformBottomSheet> createState() =>
      _SelectPlatformBottomSheetState();
}

enum PlatformEnum { allPlatform, web, app }

class _SelectPlatformBottomSheetState extends State<SelectPlatformBottomSheet> {
  PlatformEnum? selectedPlatform;

  @override
  void initState() {
    super.initState();
    selectedPlatform = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        title: SharedLocalizations.of(context)!.selectPlatform,
        primaryButtonOnPressed: (context) {
          context.read<AddVoucherBloc>().add(SelectPlatform(selectedPlatform!));
        },
        itemBuilder: Column(
          children:[ 
            buildItemPlatform(SharedLocalizations.of(context)!.allPlatforms, PlatformEnum.allPlatform, () {
              setState(() {
                selectedPlatform = PlatformEnum.allPlatform;
              });
            }),
            buildItemPlatform(SharedLocalizations.of(context)!.web, PlatformEnum.web,() {
              setState(() {
                selectedPlatform = PlatformEnum.web;
              });
            }),
            buildItemPlatform(SharedLocalizations.of(context)!.app, PlatformEnum.app,() {
            setState(() {
              selectedPlatform = PlatformEnum.app;
            });
          }),

        ],
      ),
    );
  }

  Widget buildItemPlatform(String title, PlatformEnum value, Function()? onTap) 
   => GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                    color: Color(0xFF344053),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  )),
            ),
            selectedPlatform == value
              ? const icon.SoctripIcon(icon.Icons.check,
                    style: TextStyle(color: Colors.blueGrey),
                )
              : Container(),
          ],
        ),
      ),
    );
}
