import 'package:flutter/material.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/shared_module.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/backpack.png",
                package: packageName),
            const SizedBox(height: 16),
            Text(
              SharedLocalizations.of(context)!.noData,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF0F1728),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
