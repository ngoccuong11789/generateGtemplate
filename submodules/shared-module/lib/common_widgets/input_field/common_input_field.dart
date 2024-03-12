import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/input_text.dart';

class CommonInputField extends StatefulWidget {
  const CommonInputField({
    super.key,
    required this.onChanged,
    required this.hint,
    required this.title,
    required this.keyboardType,
    this.value,
    this.leading,
    this.subtitle,
    this.trailing,
    this.enable = true,
    this.validator,
    this.isRequired= true,
  });

  final Function(String) onChanged;
  final String hint;
  final String title;
  final String? value;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool? enable;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool? isRequired;

  @override
  State<CommonInputField> createState() => _CommonInputFieldState();
}

class _CommonInputFieldState extends State<CommonInputField> {
  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
   if (widget.value != null) _textController.text = widget.value!;
  }

  @override
  Widget build(BuildContext context) {
    return InputText(
          labelText: widget.title,
          isRequired: widget.isRequired!,
          child: TextFormField(
            key: widget.key,
            keyboardType: widget.keyboardType,
            focusNode: null,
            onChanged: (value) {
              widget.onChanged(value);
            },
            decoration: inputDecorationForInputText(
                prefixIcon: widget.leading,
                suffixIcon: widget.trailing,                
                enabled: widget.enable,
                hintText: widget.hint),
            style: const TextStyle(
              color: Color(0xFF344054),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            validator: widget.validator,
            controller: _textController,
            maxLength: 30,
          ),
       
    );
  }
}
