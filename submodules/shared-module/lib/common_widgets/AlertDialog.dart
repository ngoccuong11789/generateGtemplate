//custom_alert_dialog.dart
import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/red_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title, description;
  final VoidCallback? onPressed;
  final VoidCallback? onActionNo;
  final bool isOneButton;
  const CustomAlertDialog({
    Key? key,
    required this.title,
    this.isOneButton = false,
    required this.description, required this.onPressed, this.onActionNo
  }) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          !widget.isOneButton ? Container(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: SecondaryButton(SharedLocalizations.of(context)!.no, onPressed: widget.onActionNo,),),
                const Padding(padding: EdgeInsets.only(left: 8.0)),
                Expanded(child: PrimaryButton(SharedLocalizations.of(context)!.yes, onPressed: widget.onPressed,))
              ],
            ),
          ) : Container(
            padding: const EdgeInsets.all(5.0),
            child: Expanded(child: RedButton(SharedLocalizations.of(context)!.ok, onPressed: widget.onPressed))
          )
        ],
      ),
    );
  }
}
