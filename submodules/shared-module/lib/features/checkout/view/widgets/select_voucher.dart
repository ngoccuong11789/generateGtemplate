import 'package:flutter/material.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/package_util.dart';

class SelectVoucher extends StatelessWidget {
  const SelectVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              SharedLocalizations.of(context)!.vouchers,
              style: const TextStyle(
                color: Color(0xFF344053),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.43,
              ),
            ),
          ),
          InkWell(
            onTap: () {}, // Handle your callback
            child: package.createSvgFromAsset(AssetHelper.chevronRight),
          )
        ],
      ),
    );
  }
}
