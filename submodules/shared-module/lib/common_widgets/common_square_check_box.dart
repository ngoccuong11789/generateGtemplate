import 'package:flutter/material.dart';

class CommonSquareCheckBox extends StatefulWidget {
  const CommonSquareCheckBox({super.key, required this.value, this.onChanged});

  final Function(bool?)? onChanged;
  final bool value;

  @override
  State<CommonSquareCheckBox> createState() => _CommonSquareCheckBoxState();
}

class _CommonSquareCheckBoxState extends State<CommonSquareCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: widget.onChanged,
      side: MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(
            color: widget.value
                ? const Color(0xFF156FEE)
                : const Color(0xFFCFD4DC)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      fillColor: widget.value
          ? const MaterialStatePropertyAll<Color>(Color(0xFFEFF8FF))
          : const MaterialStatePropertyAll<Color>(Colors.transparent),
      checkColor: const Color(0xFF156FEE),
      activeColor: const Color(0xFFEFF8FF),
    );
  }
}
