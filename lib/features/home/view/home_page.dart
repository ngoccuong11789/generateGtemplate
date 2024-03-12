import 'package:flutter/material.dart';
import 'package:soctrip_super_app/common_widgets/store_webview.dart';
import 'package:soctrip_super_app/common_widgets/tab_screen_demo.dart';
import 'package:soctrip_super_app/common_widgets/nav_bar.dart';
import 'package:soctrip_super_app/common_widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    this.callback,
    this.args,
  }) : super(key: key);

  final VoidCallback? callback;
  final List<Object>? args;

  static Route<void> route({VoidCallback? callback, List<Object>? args}) {
    return MaterialPageRoute<void>(
        builder: (_) => HomePage(callback: callback, args: args));
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                TopBar(),
                Expanded(
                  child: TabBarView(
                    children: [
                      TabScreenDemo(title: 'Screen 1'),
                      StoreWebview(title: 'Store 2'),
                      TabScreenDemo(title: 'Screen 3'),
                      StoreWebview(title: 'Store 4'),
                      StoreWebview(title: 'Store 5'),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 100,
              right: 25,
              left: 25,
              child: NavBar(),
            )
          ],
        ),
      ),
    );
  }
}
