import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookBloc.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookEvent.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressbookState.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/AddressBook/model/CreateAddress.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'AddressDetail.dart';
import 'AddressWidget.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class AddressBookWidget extends StatefulWidget {
  const AddressBookWidget({super.key, this.isFromCheckout = false, this.idAddressSelected});

  final bool isFromCheckout;
  final String? idAddressSelected;

  @override
  State<AddressBookWidget> createState() => _AddressBookWidgetState();
}

class _AddressBookWidgetState extends State<AddressBookWidget> {
  TextEditingController controller = TextEditingController();
  AddressNewModel newAddress = AddressNewModel(
      userFullName: null,
      userPhoneNumber: null,
      address: null,
      country: null,
      city: null,
      district: null,
      ward: null,
      addressType: typeHOME,
      isDefault: false);

  ListView collections(List<AddressNewModel> data,
      AddressBookState addressBookState, BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, position) {
        return BlocBuilder<AddressBookBloc, AddressBookState>(
          builder: (context, state) {
            return AddressWidget(
              isFromCheckout: widget.isFromCheckout,
              idAddressSelected: widget.idAddressSelected ?? state.selectedAddress?.id ?? '',
              addressNewData: data[position],
              selectDefaultAddress: () => showDialog<String>(
                context: context,
                builder: (BuildContext contextDialog) => AlertDialog(
                  title: Text(
                      SharedLocalizations.of(context)!.changeDefaultAddress),
                  content: Text(
                      SharedLocalizations.of(context)!.confirmDefaultAddress),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(contextDialog),
                      child: Text(SharedLocalizations.of(context)!.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AddressBookBloc>().add(UpdateAddress(
                            data[position].copyWith(isDefault: true),
                            data[position].id!));
                        Navigator.pop(contextDialog);
                      },
                      child: Text(SharedLocalizations.of(context)!.ok),
                    ),
                  ],
                ),
              ),
              editAddress: () {
                context.read<AddressBookBloc>().add(LoadDataForAddress(
                    wardName: data[position].ward,
                    districtName: data[position].district,
                    cityName: data[position].city,
                    country: data[position].country,
                    data: data[position]));
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    return BlocProvider.value(
                      value: BlocProvider.of<AddressBookBloc>(context),
                      child: AddressDetail(initValue: data[position]),
                    );
                  },
                ));
              },
            );
          },
        );
      },
    );
  }

  Widget _buttonAddNew(BuildContext contextProvider) {
    return BlocBuilder<AddressBookBloc, AddressBookState>(
        builder: (context, addressState) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.primary,
              shadowColor: Colors.transparent,
              shape: const BeveledRectangleBorder()),
          onPressed: () {
            context
                .read<AddressBookBloc>()
                .add(LoadDataForAddress(data: newAddress));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return BlocProvider.value(
                    value: BlocProvider.of<AddressBookBloc>(context),
                    child: const AddressDetail());
              },
            ));
          },
          icon: const icon.SoctripIcon(icon.Icons.plus,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              )),
          label: Text(
            SharedLocalizations.of(context)!.addNewAddress,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressBookBloc>(
        create: (context) => AddressBookBloc()..add(GetAddressList()),
      child: Scaffold(
        backgroundColor: ColorPalette.primary25,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            leadingWidth: 48,
            automaticallyImplyLeading: false,
            leading: BlocBuilder<AddressBookBloc, AddressBookState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(state.selectedAddress);
                      },
                      icon: const icon.SoctripIcon(
                        icon.Icons.chevronLeft,
                        style: TextStyle(fontSize: 20),
                      ));
                }),
            centerTitle: true,
            flexibleSpace: Image.asset(
              AssetHelper.appBarBackground,
              package: packageName,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            title: Text(
              SharedLocalizations.of(context)!.address,
              style: const TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
            )),
        body: BlocConsumer<AddressBookBloc, AddressBookState>(
          builder: (context, addressBookState) {
            return Column(
              children: [
                Expanded(
                    child: collections(
                        addressBookState.data, addressBookState, context)),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: _buttonAddNew(context)),
              ],
            );
          },
          listener: (BuildContext context, AddressBookState state) {
            if (state.fetchData == true) {
              context.read<AddressBookBloc>().add(GetAddressList());
            }
          },
        )
      ),
    );
  }
}
