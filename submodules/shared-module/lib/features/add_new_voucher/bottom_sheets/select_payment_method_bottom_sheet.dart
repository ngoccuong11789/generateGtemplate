import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/add_new_voucher/api/add_voucher_controller.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/models/payment_type.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/custom_bottom_sheet.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectPaymentMethodBottomSheet extends StatefulWidget {
  SelectPaymentMethodBottomSheet({super.key, required this.value});
  PaymentType? value;

  @override
  State<SelectPaymentMethodBottomSheet> createState() =>
      _SelectPaymentMethodBottomSheetState();
}

class _SelectPaymentMethodBottomSheetState
    extends State<SelectPaymentMethodBottomSheet> {
  late Future<List<PaymentType>> types;
  PaymentType? selectedPaymentType;

  @override
  void initState() {
    types = getTypes();
    selectedPaymentType = widget.value;
    super.initState();
  }

  Future<List<PaymentType>> getTypes() async {
    return await AddVoucherController(SharedModule.appDelegates!.dio)
        .getPayment() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: types,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CustomBottomSheet(
            title: SharedLocalizations.of(context)!.chooseYourPaymentMethod,
            primaryButtonOnPressed: selectedPaymentType == null ? null : (context) {
              context.read<AddVoucherBloc>().add(SelectPaymentType(selectedPaymentType!));              
            },
            itemBuilder: Column(
              children:[            
                ...snapshot.data!.map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPaymentType = e;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(e.name ?? "",
                                  style: const TextStyle(
                                    color: Color(0xFF344053),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            selectedPaymentType?.id == e.id
                                ? const icon.SoctripIcon(icon.Icons.check,
                                    style: TextStyle(color: Colors.blueGrey),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ))
                  ]
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
