import 'package:flutter/material.dart';
import 'package:shared_module/utils/input_text.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class CommonDropDown extends StatelessWidget {
  const CommonDropDown(
      {super.key,
      required this.title,
      this.subtitle,
      required this.hint,
      this.value,
      required this.onTap,
      this.leading,
      this.isEmpty = true,
      this.trailing});

  final String title;
  final String hint;
  final String? value;
  final VoidCallback onTap;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subtitle;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return InputText(
      labelText: title,
      isRequired: isEmpty,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.50, color: Color(0xFF344054),              
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ?? Container(),
              Expanded(
                child: SizedBox(
                  child: Text(
                    (value != null && value!.isNotEmpty) ? value! : hint,
                    style: TextStyle(
                      color: value != null&& value!.isNotEmpty  ? Color(0xFF344054) : Color(0xFF98A2B3),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                  ),
                ),
              ),
              trailing ?? const icon.SoctripIcon(icon.Icons.chevronDown, style: TextStyle(fontSize: 18.0,)),
            ],
          ),
        ),
      ),
    );
  }
}
