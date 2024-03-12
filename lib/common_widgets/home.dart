import 'package:flutter/material.dart';
import 'package:soctrip_super_app/common_widgets/store_webview.dart';
import 'package:soctrip_super_app/common_widgets/tab_screen_demo.dart';
import 'package:soctrip_super_app/common_widgets/nav_bar.dart';
import 'package:soctrip_super_app/common_widgets/top_bar.dart';
import 'package:soctrip_super_app/localization/localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    this.bookNow,
    this.shopNow,
  }) : super(key: key);

  final VoidCallback? bookNow;
  final VoidCallback? shopNow;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            const Column(
              children: [
                TopBar(),
                Expanded(
                  child: TabBarView(
                    children: [
                      TabScreenDemo(title: 'Screen 1'),
                      TabScreenDemo(title: 'Screen 2'),
                      StoreWebview(title: 'Store 3'),
                      TabScreenDemo(title: 'Screen 4'),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 100,
              right: 25,
              left: 25,
              child: NavBar(),
            ),
            Positioned(child: Text(AppLocalizations.of(context)!.helloWorld))
          ],
        ),
      ),
    );
  }
}
