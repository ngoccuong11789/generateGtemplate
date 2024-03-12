import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/common_widgets/common_square_check_box.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/custom_date_time_picker.dart';
import 'package:shared_module/utils/input_text.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class ValidPeriod extends StatefulWidget {
  const ValidPeriod({super.key});

  @override
  State<ValidPeriod> createState() => _ValidPeriodState();
}

class _ValidPeriodState extends State<ValidPeriod> {
  DateTime? startDate;
  DateTime? endDate;
  bool noExpiredDate = false;

  void _selectStartDate(BuildContext context) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (_) => BlocProvider.value(
            value: context.read<AddVoucherBloc>(),
            child: CustomDateTimePicker(
                title: SharedLocalizations.of(context)!.selectStartDate,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
                onSavePressed: (context, value) {
                  DateTime picked = DateFormat("yyyy-MM-dd HH:mm:ss").parse(value);
                  setState(() {
                    startDate = picked;
                    endDate = null;
                    context.read<AddVoucherBloc>().add(SetStartDate(startDate!));
                    context.read<AddVoucherBloc>().add(SetEndDate(
                        DateTime(picked.year, picked.month, picked.day, 23, 59,
                            59)));
                  });
                })));
  }

  void _selectEndDate(
      BuildContext context, DateTime initialDate, DateTime firstDate) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (_) => BlocProvider.value(
            value: context.read<AddVoucherBloc>(),
            child: CustomDateTimePicker(
              title: SharedLocalizations.of(context)!.selectEndDate,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: DateTime(2101),
              onSavePressed: (context, value) {
                DateTime picked = DateFormat("yyyy-MM-dd HH:mm:ss").parse(value);
                setState(() {
                  endDate = picked;
                 context.read<AddVoucherBloc>().add(SetEndDate(endDate!));
                });
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InputText(
      labelText: SharedLocalizations.of(context)!.validPeriod,
      widgetRightTitle: Row(
        children: [
          SizedBox(
              height: 16,
              width: 16,
              child: CommonSquareCheckBox(
                value: noExpiredDate,
                onChanged: (value) {
                  setState(() {
                    context.read<AddVoucherBloc>().add(SetEndDate(DateTime(2050, 1, 1)));
                    noExpiredDate = value!;
                  });
                },
              )),
          const SizedBox(width: 5),
          Text(
            SharedLocalizations.of(context)!.noExpiryDate,
            style: const TextStyle(
              color: Color(0xFF344054),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0.10,
            ),
          ),
        ],
      ),
      child: Column(children: [
        buildDropDown(
            SharedLocalizations.of(context)!.selectStartDate,
            startDate != null
                ? DateFormat("dd/MM/yyyy HH:mm").format(startDate!)
                : "",
            () => _selectStartDate(context)),
        const SizedBox(height: 8),
        buildDropDown(
            SharedLocalizations.of(context)!.selectEndDate,
            endDate != null
                ? DateFormat("dd/MM/yyyy HH:mm").format(endDate!)
                : "",  noExpiredDate
              ? null: () {
                _selectEndDate(context, startDate ?? DateTime.now(),
                  startDate ?? DateTime.now());
        })
      ]),
    );
  }

    Widget buildDropDown(String hint, String? value, void Function()? onTap,) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: onTap == null ? Colors.grey.withOpacity(0.2) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.50,
              color: Color(0xFF344054),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  child: Text(
                    (value != null && value.isNotEmpty) ? value : hint,
                    style: TextStyle(
                      color: value != null && value.isNotEmpty
                          ? Color(0xFF344054)
                          : Color(0xFF98A2B3),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                  ),
                ),
              ),
              const icon.SoctripIcon(icon.Icons.calendar,
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ],
          ),
        ),
      );
}
