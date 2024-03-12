import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/input_text.dart';

class MaximumDiscountPrice extends StatefulWidget {
  const MaximumDiscountPrice({super.key});

  @override
  State<MaximumDiscountPrice> createState() => _MaximumDiscountPriceState();
}

enum MaxDiscountPrice { setAmount, noLimit }

class _MaximumDiscountPriceState extends State<MaximumDiscountPrice> {
  MaxDiscountPrice maxDiscountPrice = MaxDiscountPrice.setAmount;

  @override
  Widget build(BuildContext context) {
    return InputText(
        labelText: SharedLocalizations.of(context)!.maximumDiscountPrice,
        isRequired: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...buildRadioItem(SharedLocalizations.of(context)!.setAmount,
                    MaxDiscountPrice.setAmount, (value) {
                  setState(() {
                    maxDiscountPrice = value!;
                    context.read<AddVoucherBloc>().add(ChangeDiscountLimitType(maxDiscountPrice));
                  });
                }),
                const Spacer(),
                ...buildRadioItem(SharedLocalizations.of(context)!.noLimit,
                    MaxDiscountPrice.noLimit, (value) {
                  setState(() {
                    maxDiscountPrice = value!;
                    context.read<AddVoucherBloc>().add(ChangeDiscountLimitType(maxDiscountPrice));
                  });
                })
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: null,
              onChanged: (value) {
                BlocProvider.of<AddVoucherBloc>(context)
                    .add(SetMaximumDiscount(value));
              },
              decoration: inputDecorationForInputText(
                enabled: maxDiscountPrice == MaxDiscountPrice.setAmount &&
                  context.watch<AddVoucherBloc>().state.discountType != "PRICE",
                prefixIcon: Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    child:const Text("\$",
                    style: TextStyle(
                      color: Color(0xFF344054),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ))),
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
            )
          ],
        ));
  }

  List<Widget> buildRadioItem(
    String title,
    MaxDiscountPrice value,
    void Function(MaxDiscountPrice?)? onChanged,
  ) {
    return [
        SizedBox(
        height: 30,
        child: Radio(value: value, groupValue: maxDiscountPrice, onChanged: onChanged)),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ];
  }
}
