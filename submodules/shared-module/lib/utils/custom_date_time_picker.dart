import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/custom_bottom_sheet.dart';
import 'package:quiver/time.dart';


class CustomDateTimePicker extends StatefulWidget {
  CustomDateTimePicker({
    required this.title,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.onSavePressed,
    this.onCancelPressed,
    this.titleBtnSave,
    this.mode = DateTimePickerMode.dateAndTime
  });
  final String title;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(BuildContext context, String value)? onSavePressed;
  final Function? onCancelPressed;
  final String? titleBtnSave;
  final DateTimePickerMode mode;

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  late int _year;
  late int _month;
  late int _day;
  late int _hour;
  late int _minutes;
  int _dayFollowMonth = 31;
  late List<String> firstDate;
  late List<String> firstTime;

  @override
  void initState() {
    List<String> initialDate = DateFormat("yyyy-MM-dd").format(widget.initialDate).split("-");
    List<String> initialTime = DateFormat("HH:mm").format(widget.initialDate).split(":");
    firstDate = DateFormat("yyyy-MM-dd").format(widget.firstDate).split("-");
    firstTime = DateFormat("HH:mm").format(widget.firstDate).split(":");
    _year = int.parse(initialDate[0]);
    _month = int.parse(initialDate[1]);
    _day = int.parse(initialDate[2]);
    _hour = int.parse(initialTime[0]);
    _minutes = int.parse(initialTime[1]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: widget.title,
      primaryButtonOnPressed: (context) {
        if (widget.onSavePressed != null) {
          widget.onSavePressed!(context,
              "$_year-${_month.toString().padLeft(2, "0")}-${_day.toString().padLeft(2, "0")} ${_hour.toString().padLeft(2,"0")}:${_minutes.toString().padLeft(2,"0")}:00");
        }
      },
      secondButtonOnPressed: (context) {
        if (widget.onCancelPressed != null) {
          widget.onCancelPressed!();
        }
      },
      itemBuilder:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.mode != DateTimePickerMode.time)...[
                Expanded(
                  child: NumberPicker(
                    key: const Key("MonthPickerKey"),
                    textMapper: (value) => getMonth(context, int.parse(value)),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFFDDDDDD),
                    ),
                    selectedTextStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFF333333),
                    ),
                    value: _month,
                    minValue: 1,
                    maxValue: 12,
                    onChanged: (value) {
                      _verifyDate(_day, value, _year, _hour, _minutes);
                    },
                  ),
                ),
                Expanded(
                  child: NumberPicker(
                    key: const Key("DayPickerKey"),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFFDDDDDD),
                    ),
                    selectedTextStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color:  Color(0xFF333333),
                    ),
                    value: _day,
                    minValue: 1,
                    maxValue:  _dayFollowMonth,
                    onChanged: (value) {
                      _verifyDate(value, _month, _year, _hour, _minutes);
                    },
                  ),
                ),
                Expanded(
                  child: NumberPicker(
                    key: const Key("YearPickerKey"),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFFDDDDDD),
                    ),
                    selectedTextStyle:const  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color:  Color(0xFF333333),
                    ),
                    value: _year,
                    minValue: widget.firstDate.year,
                    maxValue: widget.lastDate.year,
                    onChanged: (value) {
                      _verifyDate(_day, _month, value, _hour, _minutes);
                    },
                  ),
                ),
              ],
               if (widget.mode != DateTimePickerMode.date)...[
                Expanded(
                  child: NumberPicker(
                    key: const Key("HourPickerKey"),
                    textMapper: (value) => int.parse(value) < 10 ? "0$value" : value,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFFDDDDDD),
                    ),
                    selectedTextStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFF333333),
                    ),
                    value: _hour,
                    minValue: 0,
                    maxValue: 23,
                    onChanged: (value) {
                      _verifyDate(_day, _month, _year, value, _minutes);
                    },
                  ),
                ),
                Expanded(
                  child: NumberPicker(
                    key: const Key("MinutesPickerKey"),
                    textMapper: (value) => int.parse(value) < 10 ? "0$value" : value,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFFDDDDDD),
                    ),
                    selectedTextStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color:  Color(0xFF333333),
                    ),
                    value: _minutes,
                    minValue: 0,
                    maxValue: 59,
                    onChanged: (value) {
                      _verifyDate(_day, _month, _year, _hour, value);
                    },
                  ),
                ),
              ]
            ],
          ),
        ),
    );
  }

  void _verifyDate(int day, int month, int year, int hour, int minutes) {
    int maxDaysOfMonth = daysInMonth(year, month);
    setState(() {
      day > maxDaysOfMonth
        ? _day = maxDaysOfMonth
        : _day = day;
     
      _year = year;
      _month = _year == int.parse(firstDate[0]) && month < int.parse(firstDate[1]) ? int.parse(firstDate[1]) : month;
      _day = (_year == int.parse(firstDate[0]) && _month == int.parse(firstDate[1]) && _day < int.parse(firstDate[2])) ? int.parse(firstDate[2]) : _day;
      _hour = (_year == int.parse(firstDate[0]) && _month == int.parse(firstDate[1]) && _day == int.parse(firstDate[2]) && hour < int.parse(firstTime[0])) ? int.parse(firstTime[0]) : hour;
      _minutes = (_year == int.parse(firstDate[0]) && _month == int.parse(firstDate[1]) && _day == int.parse(firstDate[2]) && hour == int.parse(firstTime[0]) && minutes < int.parse(firstTime[1])) ? int.parse(firstTime[1]) : minutes;
    });
  }

  String getMonth(BuildContext context, int month) {
    switch(month) {
      case 1: return SharedLocalizations.of(context)!.dob_1;
      case 2: return SharedLocalizations.of(context)!.dob_2;
      case 3: return SharedLocalizations.of(context)!.dob_3;
      case 4: return SharedLocalizations.of(context)!.dob_4;
      case 5: return SharedLocalizations.of(context)!.dob_5;
      case 6: return SharedLocalizations.of(context)!.dob_6;
      case 7: return SharedLocalizations.of(context)!.dob_7;
      case 8: return SharedLocalizations.of(context)!.dob_8;
      case 9: return SharedLocalizations.of(context)!.dob_9;
      case 10: return SharedLocalizations.of(context)!.dob_10;
      case 11: return SharedLocalizations.of(context)!.dob_11;
      case 12: return SharedLocalizations.of(context)!.dob_12;
    }
    return "";
  }
}
enum DateTimePickerMode {
  time,
  date,
  dateAndTime
}