import 'package:flutter/material.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class InputWidget extends StatefulWidget {
  const InputWidget(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.errorText,
      required this.controller,
      this.prefixIconColor,
      required this.isPassword,
      this.onChanged,
      required this.label,
      this.focusNode});

  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final String? errorText;
  final Color? prefixIconColor;
  final bool isPassword;
  final String label;
  final Function(String data)? onChanged;
  final FocusNode? focusNode;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool showData = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700)),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: 44,
          child: TextField(
            focusNode: widget.focusNode,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade900),
            controller: widget.controller,
            obscureText: widget.isPassword && showData,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              hintText: widget.hintText,
              errorText: widget.errorText,
              prefixIconColor: widget.prefixIconColor,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8)),
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showData = !showData;
                        });
                      },
                      child: const icon.SoctripIcon(icon.Icons.solidEye))
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
