import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({super.key, this.enable = true, this.hint = ""});

  final bool enable;
  final String hint;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      clipBehavior: Clip.none,
      child: TextField(
        enabled: widget.enable,
        decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(width: 0.50, color: Color(0xFFCFD4DC)))),
        buildCounter: (context,
            {required currentLength, required isFocused, maxLength}) {
          return SizedBox(
            width: double.infinity,
            child: Text(
              SharedLocalizations.of(context)!
                  .characters(currentLength, maxLength!),
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF475466),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
          );
        },
        style: const TextStyle(
          color: Color(0xFF667084),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 1.43,
        ),
        maxLength: 30,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        autofocus: true,
      ),
    );
  }
}
