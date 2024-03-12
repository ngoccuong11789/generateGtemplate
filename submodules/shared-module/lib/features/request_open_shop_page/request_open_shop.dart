import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_module/features/request_open_shop_page/bloc/request_to_open_shop_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import '../../common_widgets/AppBar/view/main_appbar.dart';
import '../../constants/constants.dart';
import 'views/form_screen.dart';

class RequestToOpenShop extends StatelessWidget {
  const RequestToOpenShop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RequestToOpenShopBloc(),
        child: const StartScreen());
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleAppbar: SharedLocalizations.of(context)!.requestOpenShop,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 11.5),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 2.5,
              child: SvgPicture.asset(
                "assets/menu-icons/request_open_shop.svg",
                package: packageName,
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              SharedLocalizations.of(context)!.welcomeToSoctripSeller,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF0F1728),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              SharedLocalizations.of(context)!.requestOpenShopPrompt,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF475466),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            const _StartRegistration(),
          ],
        ),
      ),
    );
  }
}

class _StartRegistration extends StatelessWidget {
  const _StartRegistration();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF156FEE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: RequestToOpenShopBloc(),
                child: FormScreen(),
              ),
            ),
          );
        },
        child: Center(
          child: Text(
            SharedLocalizations.of(context)!.startRegistration,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
