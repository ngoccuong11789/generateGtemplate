import 'package:flutter/cupertino.dart';
import 'package:shared_module/localization/localizations.dart';

class RatingStatus{
  static String status({required BuildContext context, required double countRating}){
    switch(countRating){
      case 1:
        {
          return SharedLocalizations.of(context)!.terrible;
        }
      case 2:
        {
          return SharedLocalizations.of(context)!.poor;
        }
      case 3:
        {
          return SharedLocalizations.of(context)!.fair;
        }
      case 4:
        {
          return SharedLocalizations.of(context)!.good;
        }
      default:
        {
          return SharedLocalizations.of(context)!.amazing;
        }
    }
  }
}