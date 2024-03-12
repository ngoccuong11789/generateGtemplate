import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/localization/localizations.dart';

class NoteInput extends StatefulWidget {
  final EntityDtos? data;
  final Set<String>? selectedShops;
  final Set<String>? selectedProducts;
  final Function(String) onGetNote;
  const NoteInput({super.key, this.data, this.selectedShops, this.selectedProducts, required this.onGetNote});

  @override
  State<NoteInput> createState() => _NoteInputState();
}

class _NoteInputState extends State<NoteInput> {
  TextEditingController noteOther = TextEditingController();

  bool checkSelected() {
    if (widget.selectedShops?.contains(widget.data?.id) ?? true) {
      return true;
    } else {
      for (ObjectDtOs i in (widget.data?.objectDTOs ?? [])) {
        if (widget.selectedProducts?.contains(i.stockId) ?? true) {
          return true;
        }
      }
      noteOther.clear();
      return false;
    }
  }

  void getNote(String text) {
    widget.onGetNote(text);
  }

  @override
  Widget build(BuildContext context) {
    if (checkSelected()) {
      return Column(
        children: [
          const Divider(
            color: ColorPalette.grey200,
            height: 5,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${SharedLocalizations.of(context)!.note}:",
                    style: const TextStyle(
                      color: Color(0xFF344053),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                  ),
                  Container(
                    width: 14.0,
                  ),
                  Expanded(
                      child: Container(
                          height: 40.0,
                          child: TextField(
                            controller: noteOther,
                            onChanged: (newValue) {
                              getNote(newValue);
                            },
                            style: const TextStyle(
                              color: Color(0xFF667084),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: SharedLocalizations.of(context)!
                                  .inputNoteCheckOut,
                              hintStyle: const TextStyle(
                                color: Color(0xFF98A2B3),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(8),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFCFD4DC), width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFCFD4DC), width: 1),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}