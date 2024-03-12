import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/bottom_sheet.dart';
import 'package:shared_module/common_widgets/input_field/common_drop_down.dart';
import 'package:shared_module/common_widgets/input_field/common_input_field.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bottom_sheets/select_area_bottom_sheet.dart';
import 'package:shared_module/features/add_new_voucher/bottom_sheets/select_payment_method_bottom_sheet.dart';
import 'package:shared_module/features/add_new_voucher/bottom_sheets/select_platform_bottom_sheet.dart';
import 'package:shared_module/features/add_new_voucher/widgets/group_title.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class EnhandceCustomerUnderstanding extends StatefulWidget {
  const EnhandceCustomerUnderstanding({super.key});

  @override
  State<EnhandceCustomerUnderstanding> createState() =>
      _EnhandceCustomerUnderstandingState();
}

class _EnhandceCustomerUnderstandingState
    extends State<EnhandceCustomerUnderstanding> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherBloc, AddVoucherState>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Color(0xFFEAECF0)),
            top: BorderSide(width: 1, color: Color(0xFFEAECF0)),
            right: BorderSide(color: Color(0xFFEAECF0)),
            bottom: BorderSide(width: 1, color: Color(0xFFEAECF0)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupTitle(
                title: SharedLocalizations.of(context)!.detailedInformation,
                description: SharedLocalizations.of(context)!
                    .enhanceYourCustomerUnderstanding),
            const SizedBox(height: 8),
            CommonDropDown(
              isEmpty: true,
              title: SharedLocalizations.of(context)!.paymentMethod,
              hint: SharedLocalizations.of(context)!.chooseYourPaymentMethod,
              value: state.paymentTypeId.name,
              onTap: () {
                 showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => BlocProvider.value(
                      value: context.read<AddVoucherBloc>(),
                      child: SelectPaymentMethodBottomSheet(value: state.paymentTypeId,)),
                );
              },
            ),
            const SizedBox(height: 8),            
            CommonDropDown(
              title: SharedLocalizations.of(context)!.platform,
              isEmpty: true,
              hint: SharedLocalizations.of(context)!.chooseYourPlatform,
              value: state.platform == "ALL"
                  ? SharedLocalizations.of(context)!.allPlatforms
                  : state.platform == "WEB"
                      ? SharedLocalizations.of(context)!.web
                      : state.platform == "APP" ? SharedLocalizations.of(context)!.app : "",
              onTap: () {
                 showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => BlocProvider.value(
                      value: context.read<AddVoucherBloc>(),
                      child: SelectPlatformBottomSheet(value: state.platform == "ALL"
                        ? PlatformEnum.allPlatform
                        : state.platform == "WEB"
                        ? PlatformEnum.web
                        : state.platform == "APP" ? PlatformEnum.app : null,)),
                );
              },
            ),
            const SizedBox(height: 8),
            CommonDropDown(
              title: SharedLocalizations.of(context)!.applyForArea,
              isEmpty: true,
              hint: SharedLocalizations.of(context)!.selectArea,
              value: state.areas.map((e) => e.countryName).toList().join(" ,"),
              onTap: () {
                 showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => BlocProvider.value(
                      value: context.read<AddVoucherBloc>(),
                      child: SelectAreaBottomSheet(value: state.areas,)),
                );
              },
            ),
            const SizedBox(height: 8),       
            CommonInputField(
              title: SharedLocalizations.of(context)!.description,
              hint: SharedLocalizations.of(context)!.inputDescriptionHere,
              onChanged: (value) {
                context.read<AddVoucherBloc>().add(SetDescription(value));
              },
              keyboardType: TextInputType.name,
            ),
          ],
        ),
      ),
    );
  }
}
