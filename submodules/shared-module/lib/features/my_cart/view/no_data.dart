import 'package:flutter/material.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/package_util.dart';
import 'package:shared_module/constants/AccessHelper.dart';

class NotData extends StatelessWidget {
  const NotData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: package.createSvgFromAsset(AssetHelper.emptyIcon,
                width: 50.0, height: 50.0),
          ),
          SizedBox(
            child: Text(
              SharedLocalizations.of(context)!.noData,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF0F1728),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
