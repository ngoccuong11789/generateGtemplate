import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/update_shop/views/waiting_approve.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import '../bloc/update_shop_bloc.dart';
import '../widgets/bottom_action_bar.dart';
import 'form_screen/shop_information.dart';

class UpdateShopFormScreen extends StatefulWidget {
   const UpdateShopFormScreen({super.key});

  @override
  State<UpdateShopFormScreen> createState() => _UpdateShopFormScreenState();
}

class _UpdateShopFormScreenState extends State<UpdateShopFormScreen> {
  final UpdateShopBloc bloc = UpdateShopBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<UpdateShopBloc, UpdateShopState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MainAppBar(
              titleAppbar: SharedLocalizations.of(context)!.shopInformation,
            ),
            backgroundColor: ColorPalette.gray100,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const ShopInformation(),
                  const SizedBox(height: 12,),
                  BottomActionBar(
                    controller: bloc.sendRequest(),
                    text: SharedLocalizations.of(context)!.save,
                    onPressed: () {
                      BlocProvider.of<UpdateShopBloc>(context).add(
                        HandleSendRequestUpdateShop(
                          state.shopModelUpdate.merchantName,
                          state.userModelUpdate.fullName,
                          state.userModelUpdate.phoneNumber,
                          state.selectedCountries,
                          state.selectedProvince,
                          state.selectedDistrict,
                          state.shopModelUpdate.addressLineTwo,
                          state.userModelUpdate.email,
                          state.shopModelUpdate.addressLineOne,
                          state.isInvoiceExact,
                        ),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return WaitingApproveUpdateShop(userModel: state.userModelUpdate, shopModel: state.shopModelUpdate);
                        },
                      ));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
