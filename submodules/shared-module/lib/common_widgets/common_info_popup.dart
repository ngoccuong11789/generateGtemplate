import 'package:shared_module/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonInfoPopup extends SnackBar {
  CommonInfoPopup({super.key, required this.info, this.redirect})
      : super(
          action: redirect,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: Color(0xFF6BE9A6)),
            borderRadius: BorderRadius.circular(12),
          ),
          showCloseIcon: true,
          closeIconColor: const Color(0xFF027947),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          behavior: SnackBarBehavior.floating,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          backgroundColor: const Color(0xFFF5FEF9),
          elevation: 0,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(
                  'assets/icons/info-check.svg',
                  package: packageName,
                ),
              ),
              Expanded(
                child: Text(
                  info,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: Color(0xFF027947),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );

  final String info;
  final SnackBarAction? redirect;
}
