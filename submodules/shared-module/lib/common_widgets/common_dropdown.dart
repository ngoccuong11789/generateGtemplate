import 'package:flutter/material.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class CommonDropdown extends StatefulWidget {
  const CommonDropdown({super.key, required this.list});

  final List<String> list;

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.list.first;

    return DropdownMenu<String>(
      textStyle: const TextStyle(
        color: Color(0xFF667084),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        height: 1.43,
      ),
      menuStyle: MenuStyle(
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 14, vertical: 10)),
        shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: Color(0xFFCFD4DC)),
            borderRadius: BorderRadius.circular(8))),
      ),
      trailingIcon: const icon.SoctripIcon(icon.Icons.chevronDown),
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries:
          widget.list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
