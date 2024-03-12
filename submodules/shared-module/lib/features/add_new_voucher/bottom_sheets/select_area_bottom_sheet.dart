import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/add_new_voucher/api/add_voucher_controller.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/models/area_type.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/custom_bottom_sheet.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class SelectAreaBottomSheet extends StatefulWidget {
  SelectAreaBottomSheet({super.key, required this.value});
  List<AreaType> value;

  @override
  State<SelectAreaBottomSheet> createState() =>
      _SelectAreaBottomSheetState();
}
class _SelectAreaBottomSheetState extends State<SelectAreaBottomSheet> {
  late Future<List<AreaType>> types;
  List<AreaType> selectArea = [];
  List<String> listSelect = [];

   Future<List<AreaType>> getTypes() async {
    return await AddVoucherController(SharedModule.appDelegates!.dio).getArea();        
  }

  @override
  void initState() {
    types = getTypes();
    selectArea = []..addAll(widget.value);
    listSelect = selectArea.map((e) => e.countryId!).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: types,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CustomBottomSheet(
            title: SharedLocalizations.of(context)!.selectArea,
            primaryButtonOnPressed: (context) {
              context.read<AddVoucherBloc>().add(SelectArea(selectArea));
            },
            itemBuilder: Column(
              children:[            
                ...snapshot.data!.map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          if (listSelect.contains(e.countryId)) {
                            listSelect.remove(e.countryId!);
                            selectArea.remove(e);
                          } else {
                            listSelect.add(e.countryId!);
                            selectArea.add(e);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(e.countryName ?? "",
                                  style: const TextStyle(
                                    color: Color(0xFF344053),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                           listSelect.contains(e.countryId)
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
    });
  }
}