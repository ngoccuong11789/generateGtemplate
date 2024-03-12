import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/AccessHelper.dart';
import '../constants/constants.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetHelper.imageErrorDefault,package: packageName, fit: BoxFit.cover,);
  }
}

Widget imageErrorBuilder (context, error, stackTrace) => const ImageError();
