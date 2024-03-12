import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/add_new_voucher/basic_information.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bottom_sheets/add_voucher_bottom_bar.dart';
import 'package:shared_module/features/add_new_voucher/configure_all_voucher_rewards.dart';
import 'package:shared_module/features/add_new_voucher/enhance_customer_understanding.dart';
import 'package:shared_module/features/add_new_voucher/inform_customer_demographic.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class AddNewVoucher extends StatefulWidget {
  const AddNewVoucher({super.key, required this.buytype});

  final BUYTYPE buytype;

  @override
  State<AddNewVoucher> createState() => _AddNewVoucherState();
}

class _AddNewVoucherState extends State<AddNewVoucher> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVoucherBloc>(
        create: (context) =>
            AddVoucherBloc()..add(SaveBuyTypeEvent(widget.buytype)),
        child: BlocBuilder<AddVoucherBloc, AddVoucherState>(
          builder: (BuildContext context, AddVoucherState state) {
            return Scaffold(
              bottomNavigationBar: BlocProvider.value(
                  value: BlocProvider.of<AddVoucherBloc>(context),
                  child: AddVoucherBottomBar()),
              appBar: MainAppBar(
                  titleAppbar: SharedLocalizations.of(context)!.addVoucher),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Color(0xFFF2F4F7)),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BasicInformation(),
                      SizedBox(height: 8),
                      ConfigureAllVoucherRewards(),
                      SizedBox(height: 8),
                      EnhandceCustomerUnderstanding(),
                      SizedBox(height: 8),
                      InformCustomerDemographic(),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
