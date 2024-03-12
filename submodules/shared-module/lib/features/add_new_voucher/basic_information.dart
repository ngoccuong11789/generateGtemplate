import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/bottom_sheet.dart';
import 'package:shared_module/common_widgets/input_field/common_drop_down.dart';
import 'package:shared_module/common_widgets/input_field/common_input_field.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bottom_sheets/select_voucher_type_bottom_sheet.dart';
import 'package:shared_module/features/add_new_voucher/widgets/group_title.dart';
import 'package:shared_module/features/add_new_voucher/widgets/input_voucher_code.dart';
import 'package:shared_module/features/add_new_voucher/widgets/valid_period.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  void setVoucherName(String value) {
    context.read<AddVoucherBloc>().add(SetVoucherName(value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherBloc, AddVoucherState>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Color(0xFFEAECF0)),
            top: BorderSide(color: Color(0xFFEAECF0)),
            right: BorderSide(color: Color(0xFFEAECF0)),
            bottom: BorderSide(color: Color(0xFFEAECF0)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupTitle(
              title: SharedLocalizations.of(context)!.basicInformation,
              description:
                  SharedLocalizations.of(context)!.kindlyFurnishVoucherDetails,
            ),
            const SizedBox(height: 8),
            CommonDropDown(
              key: Key("voucherType"),
              title: SharedLocalizations.of(context)!.voucherType,
              hint: SharedLocalizations.of(context)!.chooseYourVoucherType,
              value: state.voucherTypeId.name,
              onTap: () {
               showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => BlocProvider.value(
                      value: context.read<AddVoucherBloc>(),
                      child: SelectVoucherTypeBottomSheet(value: state.voucherTypeId,)),
                );
              },
            ),
            const SizedBox(height: 12),
            const InputVoucherCode(),
            const SizedBox(height: 12),
            CommonInputField(
                onChanged: setVoucherName,
                hint: SharedLocalizations.of(context)!.inputVoucherName,
                title: SharedLocalizations.of(context)!.voucherName,
                keyboardType: TextInputType.name,
                ),
            const SizedBox(height: 12),
            const ValidPeriod(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
