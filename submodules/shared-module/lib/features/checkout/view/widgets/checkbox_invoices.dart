
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import '../../../../constants/color_palette.dart';

class CheckInvoice extends StatefulWidget {
  final Function(bool) onInvoices;
  const CheckInvoice({super.key, required this.onInvoices});

  @override
  State<CheckInvoice> createState() => _CheckInvoiceState();
}

class _CheckInvoiceState extends State<CheckInvoice> {
  late bool isElectronic = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 8.0),
            child: Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: SizedBox(
                width: 16.0,
                height: 16.0,
                child: Checkbox(
                    side: MaterialStateBorderSide.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return const BorderSide(
                              width: 1, color: ColorPalette.primary600);
                        }
                        return const BorderSide(
                            width: 1, color: ColorPalette.gray300);
                      },
                    ),
                    activeColor: ColorPalette.primary50,
                    checkColor: ColorPalette.primary600,
                    value: isElectronic,
                    onChanged: (value) => {
                      setState(() {
                        isElectronic = !isElectronic;
                      }),
                      widget.onInvoices(value ?? false)
                    }),
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SharedLocalizations.of(context)!.electronicInvoices,
                  style: const TextStyle(
                    color: Color(0xFF344054),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  SharedLocalizations.of(context)!.desElectronicInvoices,
                  style: const TextStyle(
                    color: Color(0xFF667085),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}