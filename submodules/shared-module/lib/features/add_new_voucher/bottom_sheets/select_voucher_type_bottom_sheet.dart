import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/add_new_voucher/api/add_voucher_controller.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/models/voucher_type.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/custom_bottom_sheet.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectVoucherTypeBottomSheet extends StatefulWidget {
  SelectVoucherTypeBottomSheet({super.key, required this.value});
  VoucherType? value;

  @override
  State<SelectVoucherTypeBottomSheet> createState() =>
      _SelectVoucherTypeBottomSheetState();
}

class _SelectVoucherTypeBottomSheetState
    extends State<SelectVoucherTypeBottomSheet> {
  late Future<List<VoucherType>> types;
  VoucherType? selectedVoucherType;

  @override
  void initState() {
    types = getTypes();
    selectedVoucherType = widget.value;
    super.initState();
  }

  Future<List<VoucherType>> getTypes() async {
    return await AddVoucherController(SharedModule.appDelegates!.dio)
        .getVoucherType(
            BlocProvider.of<AddVoucherBloc>(context).state.buytype ==
                    BUYTYPE.ecommerce
                ? "SHOP"
                : "RESTAURANT");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: types,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CustomBottomSheet(
            title: SharedLocalizations.of(context)!.selectVoucherType,
            primaryButtonOnPressed: selectedVoucherType == null ? null : (context) {
              context.read<AddVoucherBloc>().add(SelectVoucherType(selectedVoucherType!));              
            },
            itemBuilder: Column(
              children:[
                ...snapshot.data!.map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedVoucherType = e;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(5),
                            child: CachedNetworkImage(
                                imageUrl: getImageById(e.icon ?? "", ImageType.mobile))),
                        Expanded(
                          child: Text(e.name ?? "",
                              style: const TextStyle(
                                color: Color(0xFF344053),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        selectedVoucherType?.id == e.id
                            ? const icon.SoctripIcon(icon.Icons.check,
                                style: TextStyle(color: Colors.blueGrey,))
                            : Container(),
                      ],
                    ),
                  ),
                ))]),
            ); 
         } else {
          return Container();
        }
      },
    );
  }
}
