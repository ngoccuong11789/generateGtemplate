import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/line.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookBloc.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookEvent.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressbookState.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/AddressBook/view/AddressBookWidget.dart';
import 'package:shared_module/features/checkout/blocs/checkout_bloc.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectAddress extends StatefulWidget {
  final CheckoutBloc bloc;
  final List<EntityDtos> data;
  const SelectAddress({super.key, required this.bloc, required this.data});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
   AddressNewModel addressNewModel = AddressNewModel();
  void openAddressList() async {
    var selectedAddress = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return AddressBookWidget(
          isFromCheckout: true,
          idAddressSelected: addressNewModel.id,
        );
      },
    ));
    BlocProvider.of<AddressBookBloc>(context)
        .add(SelectBuyingAddress(selectedAddress));
    setState(() {
      addressNewModel = selectedAddress;
    });
    widget.bloc.add(SelectedAddress(address: addressNewModel, data: widget.data));
  }

  @override
  Widget build(BuildContext context) {
    Widget typeAddress(String type, Color colorBg, Color colorText) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: ShapeDecoration(
          color: colorBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorText,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<AddressBookBloc, AddressBookState>(
      builder: (context, state) {
        if(addressNewModel.id == null){
          addressNewModel = (state.selectedAddress?.id == null ? AddressNewModel():state.selectedAddress)!;
        }
        return GestureDetector(
          onTap: () {
            openAddressList();
          },
          child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addressNewModel.id != null
                              ? Flexible(child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    addressNewModel.userFullName ??
                                        "",
                                    style: const TextStyle(
                                      color: Color(0xFF344053),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.50,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  addressNewModel
                                      .addressType ==
                                      typeHOME
                                      ? typeAddress(
                                      SharedLocalizations.of(context)!
                                          .home,
                                      const Color(0xFFFFF3ED),
                                      const Color(0xFFB93814))
                                      : typeAddress(
                                      SharedLocalizations.of(context)!
                                          .office,
                                      const Color(0xFFEBFDF2),
                                      const Color(0xFF027947)),
                                  const SizedBox(width: 8),
                                  addressNewModel.isDefault == true ? typeAddress(
                                      SharedLocalizations.of(context)!
                                          .addressDefault,
                                      const Color(0xFFEFF8FF),
                                      const Color(0xFF175CD3)) : Container()
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                addressNewModel.userPhoneNumber ??
                                    "",
                                style: const TextStyle(
                                  color: Color(0xFF667084),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                child: Text(
                                  "${addressNewModel.address ?? ""} ${addressNewModel.ward ?? ""} ${addressNewModel.district ?? ""} ${addressNewModel.city ?? ""} ${addressNewModel.country ?? ""}",
                                  style: const TextStyle(
                                    color: Color(0xFF667084),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 1.43,
                                  ),
                                ),
                              ),
                            ],
                          ))
                              : Text(
                            SharedLocalizations.of(context)!.addNewAddress,
                            style: const TextStyle(
                              color: Color(0xFF175CD3),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const icon.SoctripIcon(icon.Icons.chevronRight, style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.all(4.0)),
              ]))
        );
      },
    );
  }
}
