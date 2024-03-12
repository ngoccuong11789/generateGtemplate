import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/request_open_shop_page/model/input_variables/user_model.dart';
import 'package:shared_module/localization/shared_localizations.dart';

import '../../../../constants/color_palette.dart';
import '../../bloc/request_to_open_shop_bloc.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void _sendDataUserToParent() {
    final user = UserModel(
        fullName: fullNameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
    );
    BlocProvider.of<RequestToOpenShopBloc>(context).add(ChangeInputFieldUser(user));
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<RequestToOpenShopBloc>(context).add(const HandleGetUserInformation());
    BlocProvider.of<RequestToOpenShopBloc>(context).stream.listen((state) {
      UserModel userModel = state.userModel;
      fullNameController.text = userModel.fullName;
      emailController.text = userModel.email;
      phoneController.text = userModel.phoneNumber;

      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: ColorPalette.baseWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SharedLocalizations.of(context)!.userInformation,
            style: const TextStyle(
              color: ColorPalette.gray900,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text(
            SharedLocalizations.of(context)!.userInfoPrompt,
            style: const TextStyle(
              color: ColorPalette.gray900,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                SharedLocalizations.of(context)!.fullName,
                style: TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 3,),
              const Text(
                "*",
                style: TextStyle(
                  color: Color(0xFFD92C20),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 44,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: fullNameController,
              onChanged: (_) => _sendDataUserToParent(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: SharedLocalizations.of(context)!.enterFullName,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                SharedLocalizations.of(context)!.email,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 3,),
              const Text(
                "*",
                style: TextStyle(
                  color: Color(0xFFD92C20),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 44,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: emailController,
              onChanged: (_) => _sendDataUserToParent(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: SharedLocalizations.of(context)!.enterEmail,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                SharedLocalizations.of(context)!.phone,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 3,),
              const Text(
                "*",
                style: TextStyle(
                  color: Color(0xFFD92C20),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 44,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: phoneController,
              onChanged: (_) => _sendDataUserToParent(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: SharedLocalizations.of(context)!.enterPhone,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                ),
              ),
              keyboardType: TextInputType.number,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.digitsOnly,
              // ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _HaveAnOfflineStore extends StatelessWidget {
  const _HaveAnOfflineStore();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () => BlocProvider.of<RequestToOpenShopBloc>(context)
                .add(const ChangeOfflineStoreOption()),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 9,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: state.offlineStore,
                      activeColor: ColorPalette.primary,
                      onChanged: (bool value) =>
                          BlocProvider.of<RequestToOpenShopBloc>(context)
                              .add(const ChangeOfflineStoreOption()),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  SharedLocalizations.of(context)!.haveAnOfflineStore,
                  style: const TextStyle(
                    color: ColorPalette.grey700,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
