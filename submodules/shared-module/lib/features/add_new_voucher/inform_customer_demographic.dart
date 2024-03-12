import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/widgets/applicable_product.dart';
import 'package:shared_module/features/add_new_voucher/widgets/group_title.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class InformCustomerDemographic extends StatefulWidget {
  const InformCustomerDemographic({super.key});

  @override
  State<InformCustomerDemographic> createState() =>
      _InformCustomerDemographicState();
}

enum VoucherDisplay { sharable, allPages, livestream }

class _InformCustomerDemographicState extends State<InformCustomerDemographic> {
  VoucherDisplay selectedDisplay = VoucherDisplay.allPages;

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
            title: SharedLocalizations.of(context)!.voucherDisplayApplicabeProduct,
            description:
                SharedLocalizations.of(context)!.informCustomerDemographic,
          ),
          const SizedBox(height: 16),
          Text(
            SharedLocalizations.of(context)!.voucherDisplaySettings,
            style: const TextStyle(
              color: Color(0xFF344054),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0.10,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: selectedDisplay == VoucherDisplay.allPages
                    ? const BorderSide(width: 1, color: Color(0xFF1570EF))
                    : const BorderSide(width: 1, color: Color(0xFFD0D5DD)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: RadioListTile(contentPadding: const EdgeInsets.all(0),
              value: VoucherDisplay.allPages,
              groupValue: selectedDisplay,
              onChanged: (value) {
                setState(() {
                  selectedDisplay = value!;
                  BlocProvider.of<AddVoucherBloc>(context)
                      .add(ChangeVoucherDisplayType(selectedDisplay));
                });
              },
              subtitle: Text(
                SharedLocalizations.of(context)!.automaticallyDisplayOnHomePage,
                style: const TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: Text(
                SharedLocalizations.of(context)!.displayOnAllPages,
                style: const TextStyle(
                  color: Color(0xFF344054),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: selectedDisplay == VoucherDisplay.sharable
                    ? const BorderSide(width: 1, color: Color(0xFF1570EF))
                    : const BorderSide(width: 1, color: Color(0xFFD0D5DD)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: RadioListTile(contentPadding: const EdgeInsets.all(0),
              value: VoucherDisplay.sharable,
              groupValue: selectedDisplay,
              onChanged: (value) {
                setState(() {
                  selectedDisplay = value!;
                  BlocProvider.of<AddVoucherBloc>(context)
                      .add(ChangeVoucherDisplayType(selectedDisplay));
                });
              },
              title: Text(
                SharedLocalizations.of(context)!.toBeSharedThroughVoucherCode,
                style: const TextStyle(
                  color: Color(0xFF344054),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                SharedLocalizations.of(context)!.onlySharableViaVoucherCode,
                style: const TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const ApplicableProduct(),
        ],
      ),
    );
  }
}
