import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onGetText;
  const TextInput(
      {super.key, required this.controller, required this.hintText, required this.onGetText});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late double paddingLeft;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      child: SizedBox(
          height: 40.0,
          child: TextField(
            controller: widget.controller,
            onChanged: (newValue) {
              widget.onGetText(newValue);
            },
            style: const TextStyle(
              color: Color(0xFF667084),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF98A2B3),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(8),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCFD4DC), width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCFD4DC), width: 1),
              ),
            ),
          )),
    );
  }
}
