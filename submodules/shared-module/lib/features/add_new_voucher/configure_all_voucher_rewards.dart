import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/input_field/common_input_field.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/widgets/discount_type.dart';
import 'package:shared_module/features/add_new_voucher/widgets/group_title.dart';
import 'package:shared_module/features/add_new_voucher/widgets/maximum_discount_price.dart';
import 'package:shared_module/features/add_new_voucher/widgets/quantity_limit.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class ConfigureAllVoucherRewards extends StatefulWidget {
  const ConfigureAllVoucherRewards({super.key});

  @override
  State<ConfigureAllVoucherRewards> createState() =>
      _ConfigureAllVoucherRewardsState();
}

class _ConfigureAllVoucherRewardsState
    extends State<ConfigureAllVoucherRewards> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title: SharedLocalizations.of(context)!.voucherSettings,
            description:
                SharedLocalizations.of(context)!.plsConfigVoucherReward,
          ),
          const SizedBox(height: 16),
          const DiscountType(),
          const SizedBox(height: 8),
          const MaximumDiscountPrice(),
          const SizedBox(height: 16),
          CommonInputField(
            title: SharedLocalizations.of(context)!.minimumOrderPrice,
            leading: Container(
              alignment: Alignment.center,
              height: 18, width: 18,
              child: const Text(
                '\$',
                style: TextStyle(
                  color: Color(0xFF344054),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
            )),
            onChanged: (value) {
              context.read<AddVoucherBloc>().add(SetMinimumOrderPrice(value));
            },
            hint: '',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          const QuantityLimit(key: Key("quantity"),),
          const SizedBox(height: 8),
          CommonInputField(
            title: SharedLocalizations.of(context)!.maxDistributionPerBuyer,
            hint: SharedLocalizations.of(context)!.inputHere,
            onChanged: (value) {
              context.read<AddVoucherBloc>().add(MaxDistributionPerBuyer(value));
            },
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
