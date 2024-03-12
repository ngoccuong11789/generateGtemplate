import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/input_text.dart';

class DiscountType extends StatefulWidget {
  const DiscountType({super.key});

  @override
  State<DiscountType> createState() => _DiscountTypeState();
}

enum DiscountTypeEnum { fixAmount, byPercentage }

class _DiscountTypeState extends State<DiscountType> {
  DiscountTypeEnum selectedDiscountType = DiscountTypeEnum.fixAmount;

  @override
  Widget build(BuildContext context) {
    return InputText(
      labelText: SharedLocalizations.of(context)!.discountType,
      isRequired: true,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...buildRadioItem(SharedLocalizations.of(context)!.fixAmount, DiscountTypeEnum.fixAmount, (value) {
                setState(() {
                  selectedDiscountType = value!;
                  context.read<AddVoucherBloc>().add(ChangeDiscountType(selectedDiscountType));
                });
              },
            ),
           const Spacer(),
           ...buildRadioItem(SharedLocalizations.of(context)!.byPercentage, DiscountTypeEnum.byPercentage,(value) {
                setState(() {
                  selectedDiscountType = value!;
                  context.read<AddVoucherBloc>().add(ChangeDiscountType(selectedDiscountType));
                });
              },
            ),
          ],
        ),
       TextFormField(
          keyboardType: TextInputType.number,
          focusNode: null,
          onChanged: (value) {
              context.read<AddVoucherBloc>().add(SetDiscountAmount(value));
          },
          decoration: inputDecorationForInputText(
              prefixIcon: selectedDiscountType == DiscountTypeEnum.fixAmount
                  ? Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    child: const Text("\$",
                      style: TextStyle(
                        color: Color(0xFF344054),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                      )))
                  : null,
              suffixIcon: selectedDiscountType == DiscountTypeEnum.byPercentage
                  ? Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    child: const Text("%",
                      style: TextStyle(
                        color: Color(0xFF344054),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                      )))
                  : null,
              hintText: SharedLocalizations.of(context)!.inputHere),
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
        ),        
      ],
    ));
  }

  List<Widget> buildRadioItem(String title,DiscountTypeEnum value, void Function(DiscountTypeEnum?)? onChanged,) {
    return [
      SizedBox(
        height: 30,
        child: Radio(
          value: value,
          groupValue: selectedDiscountType,
          onChanged: onChanged
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          color: Color(0xFF344054),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0.10,
        ),
      ),
    ];
  }
}
