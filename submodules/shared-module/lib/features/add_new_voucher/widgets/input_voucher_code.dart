import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/input_text.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class InputVoucherCode extends StatefulWidget {
  const InputVoucherCode({
    super.key,
  });

  @override
  State<InputVoucherCode> createState() => _InputVoucherCodeState();
}

class _InputVoucherCodeState extends State<InputVoucherCode> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputText(
            labelText: SharedLocalizations.of(context)!.voucherCode,
            isRequired: true,
            child: TextFormField(
              controller: _textController,
              focusNode: null,
              onChanged: (value) {
                context.read<AddVoucherBloc>().add(SetVoucherCode(value));
                setState(() { });
              },
              decoration: inputDecorationForInputText(
                hintText: SharedLocalizations.of(context)!.inputYourVoucherCode,
                prefixIcon: Container(
                  padding: const EdgeInsets.only(top: 12, right: 8, bottom: 12),
                  child: Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    child: const icon.SoctripIcon(
                      icon.Icons.mail01,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                suffixIcon: Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    child: Text(
                  "${_textController.text.length}/5",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF475466),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                )),
              ),
              style: const TextStyle(
                color: Color(0xFF344054),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              maxLength: 5,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
            )),
        Text(
          SharedLocalizations.of(context)!.plsInputAlphabet,
          style: const TextStyle(
            color: Color(0xFF344054),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
