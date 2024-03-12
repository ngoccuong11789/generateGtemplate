import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/localization/shared_localizations.dart';

String dateFormat(BuildContext context, DateTime dateTime) {
  final localization = SharedLocalizations.of(context)!;
  final formatDate = localization.dateFormatForCalendar;
  final locale = localization.localeName;
  return DateFormat(formatDate, locale).format(dateTime);
}

String datetimeFormat(BuildContext context, DateTime dateTime) {
  final localization = SharedLocalizations.of(context)!;
  final formatDate = localization.datetimeFormatForCalendar;
  final locale = localization.localeName;
  return DateFormat(formatDate, locale).format(dateTime);
}

String convertTime( DateTime dateTime) {
  return DateFormat.jm().format(dateTime);
}