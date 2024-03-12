import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/request_open_shop_page/model/countries.dart';
import 'package:shared_module/features/request_open_shop_page/model/district.dart';
import 'package:shared_module/features/request_open_shop_page/model/input_variables/shop_model.dart';
import 'package:shared_module/features/request_open_shop_page/model/input_variables/user_model.dart';
import 'package:shared_module/features/request_open_shop_page/model/provinces.dart';
import 'package:shared_module/features/request_open_shop_page/model/ward.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import '../bloc/request_to_open_shop_bloc.dart';
import '../widgets/bottom_action_bar.dart';
import 'form_screen/advance_information.dart';
import 'form_screen/shop_information.dart';
import 'form_screen/user_information.dart';
import 'sucess.dart';

class FormScreen extends StatefulWidget {
   FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final RequestToOpenShopBloc bloc = RequestToOpenShopBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MainAppBar(
              titleAppbar: SharedLocalizations.of(context)!.requestOpenShop,
            ),
            backgroundColor: ColorPalette.gray100,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  ShopInformation(),
                  const SizedBox(height: 12,),
                  UserInformation(),
                  const SizedBox(height: 12),
                  AdvanceInformation(),
                  BottomActionBar(
                    controller: bloc.sendRequest(),
                    text: SharedLocalizations.of(context)!.sendRequest,
                    onPressed: () {
                      List<String> listWorkingDays = [];
                      for(var i = 0; i<state.workingDays.indexList.length;i++){
                        if(state.workingDays.indexList[i]==true){
                          listWorkingDays.add(state.workingDays.days[i]);
                        }
                      }
                      // POST REQUEST HERE
                      BlocProvider.of<RequestToOpenShopBloc>(context).add(
                        SendRequest(
                          state.shopModel.merchantName,
                          state.userModel.fullName,
                          state.userModel.phoneNumber,
                          state.selectedCountries ?? DataCountries(),
                          state.selectedProvinces ?? DataProvinces(),
                          state.selectedDistrict ?? DataDistrict() ,
                          state.selectedWard ?? DataWard(),
                          state.advancedModel.addressAdvance,
                          state.shopModel.subStreet,
                          state.userModel.email,
                          state.userModel.idCard,
                          state.openingTime,
                          state.closedTime,
                          listWorkingDays,
                          state.shopModel.addressShop,
                          state.advancedModel.googleMapUrl,
                          num.tryParse(state.advancedModel.longitude ?? "0")?.toDouble(),
                          num.tryParse(state.advancedModel.latitude ?? "0")?.toDouble(),
                          state.logoShop,
                          state.dataAttachments ?? [],
                        ),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SuccessOpenShop(userModel: state.userModel, shopModel: state.shopModel,
                            dataCountries: state.selectedCountries ?? DataCountries(),
                            dataProvinces: state.selectedProvinces ?? DataProvinces(),
                            dataDistrict: state.selectedDistrict ?? DataDistrict(),);
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
