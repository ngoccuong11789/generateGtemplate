import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class Loading {
      late BuildContext context;

      Loading(this.context);

      Future<void> startLoading() async {
        return await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const SimpleDialog(
              elevation: 0.0,
          backgroundColor: Colors.transparent,
              children: <Widget>[
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          },
        );
      }

      Future<void> stopLoading() async {
        Navigator.of(context).pop();
      }
      Future<void> showError(Object? error) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: SharedLocalizations.of(context)!.dismiss,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
        content: Text(SharedLocalizations.of(context)!.error),
      ),
    );
  }
      }