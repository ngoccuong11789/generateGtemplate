import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/checkout/blocs/checkout_bloc.dart';
import 'package:shared_module/features/checkout/model/shipment_res.dart';
import 'package:shared_module/features/checkout/view/widgets/select_dropdown_shipment.dart';
import 'package:shared_module/features/checkout/view/widgets/title_input.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/package_util.dart';

class Shipment extends StatefulWidget {
  final List<ItemShipment> list;
  final CheckoutBloc bloc;
  final Function(ItemShipment) onGetShipment;
  const Shipment(
      {super.key,
      required this.onGetShipment, required this.list, required this.bloc});

  @override
  State<Shipment> createState() => _ShipmentState();
}

class _ShipmentState extends State<Shipment> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleInput(
              title: SharedLocalizations.of(context)!.shipment,),
          widget.list.isNotEmpty
              ? SelectDropDownShipments(
                  bloc: widget.bloc,
                  shipments: widget.list,
                  onGetShipment: (newValue) {
                    widget.onGetShipment(newValue);
                  },
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    SharedLocalizations.of(context)!
                        .errorNoShipmentMethodAvailable,
                    style: const TextStyle(color: Color(0xFFB42318)),
                  ),
                ),
        ]);
  }
}
