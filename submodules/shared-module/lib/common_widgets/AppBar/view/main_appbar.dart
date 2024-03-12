import 'package:flutter/material.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class MainAppBar extends AppBar {
  MainAppBar({
    super.key,
    this.backIcon = true,
    this.search,
    this.actionsExtra,
    this.titleAppbar,
    this.contentAppbar,
    this.customLeading,
  });

  final bool backIcon;
  final List<Widget>? actionsExtra;
  final void Function()? search;
  final String? titleAppbar;
  final Widget? contentAppbar;
  final Widget? customLeading;

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  void openSideMenu() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leadingWidth: 48,
        automaticallyImplyLeading: false,
        leading: widget.customLeading ??
            (widget.backIcon
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const icon.SoctripIcon(icon.Icons.chevronLeft,
                    style: TextStyle(fontSize:  20),
                    ))
                : null),
        centerTitle: true,
        flexibleSpace: Image.asset(
          AssetHelper.appBarBackground,
          package: packageName,
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        title: widget.contentAppbar ??
            (widget.titleAppbar != null
                ? Text(
                    widget.titleAppbar!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                : Row(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: OutlinedButton(
                          onPressed: widget.search,
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(Colors.white),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                icon.SoctripIcon(icon.Icons.searchLg,
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                )),
        actions: widget.actionsExtra);
  }
}
