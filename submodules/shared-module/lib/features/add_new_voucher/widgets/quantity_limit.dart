import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/common_square_check_box.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/input_text.dart';

class QuantityLimit extends StatefulWidget {
  const QuantityLimit({super.key});

  @override
  State<QuantityLimit> createState() => _QuantityLimitState();
}

class _QuantityLimitState extends State<QuantityLimit> {
  bool noLimit = false;

  @override
  Widget build(BuildContext context) {
    return InputText(
      labelText: SharedLocalizations.of(context)!.quantity,
      isRequired: true,
      widgetRightTitle: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CommonSquareCheckBox(
              value: noLimit,
              onChanged: (value) {
                setState(() {
                  noLimit = value!;
                   context.read<AddVoucherBloc>().add(SetLimitUsage(noLimit));
                });
              },
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            SharedLocalizations.of(context)!.noLimit,
            style: const TextStyle(
              color: Color(0xFF344053),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ]),  
      child: TextFormField(
          focusNode: null,
          onChanged: (value) {
            if (value.isEmpty) {
              context.read<AddVoucherBloc>().add(const SetQuantity("0"));
            } else {
              context.read<AddVoucherBloc>().add(SetQuantity(value));
            }
            setState(() {});
          },
          enabled: !noLimit,
          keyboardType: TextInputType.number,
          decoration: inputDecorationForInputText(
            enabled: !noLimit,
            hintText: SharedLocalizations.of(context)!.inputHere,
          ),
          style: const TextStyle(
            color: Color(0xFF667084),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.43,
          ),
          maxLength: 30,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          autofocus: false,
        ),
     );
  }
}
