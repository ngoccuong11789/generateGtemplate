import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class DataNotFoundAlert extends StatefulWidget {
  const DataNotFoundAlert({super.key, this.message = ""});

  final String message;

  @override
  State<DataNotFoundAlert> createState() => _DataNotFoundAlertState();
}

class _DataNotFoundAlertState extends State<DataNotFoundAlert> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 280,
        child: AlertDialog(
          title: Text(SharedLocalizations.of(context)!.error),
          content: Column(
            children: [
              Text(SharedLocalizations.of(context)!.dataNotFound),
              Text(widget.message),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(SharedLocalizations.of(context)!.ok))
          ],
        ),
      ),
    );
  }
}
