import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/features/request_open_restaurant_page/bloc/request_to_open_restaurant_bloc.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:provider/provider.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

import '../../../utils/custom_date_time_picker.dart';

class TimeRestaurant extends StatefulWidget {
  const TimeRestaurant({
    this.opening = false,
  });

  final bool opening;

  @override
  State<TimeRestaurant> createState() => _TimeRestaurantState();
}

class _TimeRestaurantState extends State<TimeRestaurant> {

  DateTime? timeDate;

  @override
  Widget build(BuildContext context) {
    RequestToOpenRestaurantBloc requestToOpenShopBloc =
    Provider.of<RequestToOpenRestaurantBloc>(context);
    return BlocBuilder<RequestToOpenRestaurantBloc, RequestToOpenRestaurantState>(
      bloc: requestToOpenShopBloc,
      buildWhen: (previous, current) =>
      previous.openingTime != current.openingTime ||
          previous.closedTime != current.closedTime,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  widget.opening ? SharedLocalizations.of(context)!.openingTime : SharedLocalizations.of(context)!.closedTime,
                  style: const TextStyle(
                    color: Color(0xFF344053),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 3,),
                const Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xFFD92C20),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: TextButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.all(0),
                  ),
                ),
                onPressed: () async {
                  showModalBottomSheet<void>(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (_) => BlocProvider.value(
                          value: context.read<RequestToOpenRestaurantBloc>(),
                          child: CustomDateTimePicker(
                              title: SharedLocalizations.of(context)!.selectStartDate,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                              onSavePressed: (context, value)  {
                                DateTime picked = DateFormat("yyyy-MM-dd HH:mm:ss").parse(value);
                                TimeOfDay newTime = TimeOfDay(hour: picked.hour, minute: picked.minute);
                                setState(() {
                                  timeDate = picked;
                                  BlocProvider.of<RequestToOpenRestaurantBloc>(context)
                                      .add(ChangeTimes(opening: widget.opening, newTime: newTime));
                                });
                              })
                      ));
                },
                child: ListTile(
                  title: Text(
                    requestToOpenShopBloc.choosingText(widget.opening),
                    style: const TextStyle(
                      color: Color(0xFF667084),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const icon.SoctripIcon(icon.Icons.calendar),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
