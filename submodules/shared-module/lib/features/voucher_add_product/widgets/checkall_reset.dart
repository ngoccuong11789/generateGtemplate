import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/common_square_check_box.dart';
import 'package:shared_module/features/voucher_add_product/blocs/voucher_product_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';

class CheckAllReset extends StatefulWidget {
  const CheckAllReset({super.key});

  @override
  State<CheckAllReset> createState() => _CheckAllResetState();
}

class _CheckAllResetState extends State<CheckAllReset> {
  bool isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoucherProductBloc, VoucherProductState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonSquareCheckBox(
              value: isSelectAll,
              onChanged: (value) {
                if (!value!) {
                  isSelectAll = false;
                  context.read<VoucherProductBloc>().add(UnSelectAll());
                } else {
                  isSelectAll = true;
                  context.read<VoucherProductBloc>().add(SelectAll());
                }
                setState(() {});
              },
            ),
            Text(
              SharedLocalizations.of(context)!.selectAll,
              style: const TextStyle(
                color: Color(0xFF344054),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.10,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                setState(() {
                  isSelectAll = false;
                  context.read<VoucherProductBloc>().add(UnSelectAll());
                });
              },
              child: Text(
                SharedLocalizations.of(context)!.reset,
                style: state.selectedProduct.isNotEmpty
                    ? const TextStyle(
                        color: Color(0xFF1570EF),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      )
                    : const TextStyle(
                        color: Color(0xFFB2DDFF),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
