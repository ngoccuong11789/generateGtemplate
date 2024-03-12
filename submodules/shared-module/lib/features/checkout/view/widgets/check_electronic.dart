import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/features/checkout/view/widgets/text_input.dart';
import 'package:shared_module/features/checkout/view/widgets/title_input.dart';
import 'package:shared_module/localization/localizations.dart';

import '../../../../constants/color_palette.dart';

class CheckElectronic extends StatefulWidget {
  final Function(String) onGetCompanyName;
  final Function(String) onGetCompanyAddress;
  final Function(String) onGetEmail;
  final Function(String) onTaxCode;
  const CheckElectronic(
      {super.key,
      required this.onGetCompanyName,
      required this.onGetCompanyAddress,
      required this.onGetEmail,
      required this.onTaxCode});

  @override
  State<CheckElectronic> createState() => _CheckElectronicState();
}

class _CheckElectronicState extends State<CheckElectronic> {
  late bool isElectronic = false;
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController taxCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void getCompanyName(String text) {
    widget.onGetCompanyName(text);
  }

  void getCompanyAddress(String text) {
    widget.onGetCompanyAddress(text);
  }

  void getEmail(String text) {
    widget.onGetEmail(text);
  }

  void getTaxCode(String text) {
    widget.onTaxCode(text);
  }

  Widget formInput() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            SharedLocalizations.of(context)!.electronicInvoices,
            style: const TextStyle(
              color: Color(0xFF344053),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 1.43,
            ),
          ),
        ),
        TitleInput(title: SharedLocalizations.of(context)!.companyName),
        TextInput(
          controller: companyNameController,
          hintText: SharedLocalizations.of(context)!.enterCompanyName,
          onGetText: getCompanyName,
        ),
        TitleInput(title: SharedLocalizations.of(context)!.companyAddress),
        TextInput(
            controller: companyAddressController,
            hintText: SharedLocalizations.of(context)!.enterCompanyAddress,
            onGetText: getCompanyAddress),
        TitleInput(title: SharedLocalizations.of(context)!.email),
        TextInput(
            controller: emailController,
            hintText: SharedLocalizations.of(context)!.enterEmail,
            onGetText: getEmail),
        TitleInput(title: SharedLocalizations.of(context)!.taxCode),
        TextInput(
            controller: taxCodeController,
            hintText: SharedLocalizations.of(context)!.enterTaxCode,
            onGetText: getTaxCode),
        Container(
          height: 8.0,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: formInput(),
    );
  }
}
