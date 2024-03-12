import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/toast_util.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/enum/toast_status.dart';
import 'package:shared_module/features/share_to_feed/bloc/post_share_to_feed_bloc.dart';
import 'package:shared_module/features/share_to_feed/model/share_to_feed.dart';
import 'package:shared_module/features/share_to_feed/view/avatar.dart';
import 'package:shared_module/localization/localizations.dart';
import 'package:shared_module/utils/package_util.dart';

import 'description_share_to_feed.dart';

class ShareToFeedPage extends StatefulWidget {
  final ShareToFeedModel model;
  const ShareToFeedPage({super.key, required this.model});

  @override
  State<ShareToFeedPage> createState() => _ShareToFeedPageState();
}

class _ShareToFeedPageState extends State<ShareToFeedPage> {
  final TextEditingController contentController = TextEditingController();
  final PostShareToFeedBloc bloc = PostShareToFeedBloc();
  late List<ItemDropDown> itemList = [];
  late ItemDropDown selectedItem;
  late String id;

  void initDropDown(BuildContext context) {
    itemList.add(ItemDropDown(
        SharedLocalizations.of(context)!.public, AssetHelper.publicIcon));
    itemList.add(ItemDropDown(
        SharedLocalizations.of(context)!.private, AssetHelper.privateIcon));
    selectedItem = itemList[0];
  }

  Widget genInfoShareToFeed(DagObjectName dagObjectName) {
    return DescriptionShareToFeed(
      data: widget.model.descriptionShareToFeedModel,
    );
  }

  @override
  void didChangeDependencies() {
    initDropDown(context);
    bloc.add(const GetUser());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    appBar() => AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  SharedLocalizations.of(context)!.createPost,
                  style: const TextStyle(
                    color: Color(0xFF0F1728),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          leadingWidth: 150,
          flexibleSpace: Image.asset(
            AssetHelper.appBarBackground,
            package: packageName,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: package.createSvgFromAsset(AssetHelper.buttonX,
                    height: 44.0, width: 44.0),
              ),
            )
          ],
        );

    userPost() => Container(
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEAECF0)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: BlocProvider(
            create: (context) => bloc,
            child: BlocBuilder<PostShareToFeedBloc, PostShareToFeedState>(
                builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAvatar(
                    avatarId: state.user?.user.avatarThumbnailUrl ?? '',
                    size: const Size(40, 40),
                    frame: '',
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      minLines: 5,
                      maxLines: null,
                      controller: contentController,
                      onChanged: (newValue) {},
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(12),
                        hintText: SharedLocalizations.of(context)!
                            .hintCreatePost(state.user?.user.firstName ?? ''),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.50),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.50),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            })));

    choosePermission() => Row(
          children: [
            DropdownButton<ItemDropDown>(
              underline: Container(),
              icon: package.createSvgFromAsset(AssetHelper.downChevron,
                  width: 20.0, height: 20.0),
              items: itemList.map((value) {
                return DropdownMenuItem<ItemDropDown>(
                  value: value,
                  // Your row here:
                  child: Row(
                    children: [
                      package.createSvgFromAsset(value.icon),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        value.name,
                        style: const TextStyle(
                          color: Color(0xFF475466),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                );
              }).toList(),
              value: selectedItem,
              onChanged: (selectedName) {
                setState(() {
                  selectedItem = selectedName!;
                });
              },
            ),
          ],
        );

    bottomWidget() => Container(
        height: 90.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              choosePermission(),
              const SizedBox(
                width: 20.0,
              ),
              PrimaryButton(
                SharedLocalizations.of(context)!.post,
                onPressed: () {
                  bloc.add(PostAction(
                      dagObjectName: widget.model.dagObjectName,
                      shareLinkType: widget.model.shareLinkType,
                      postPrivacy: selectedItem.name,
                      content: contentController.text,
                      dagObjectId: widget.model.dagObjectId));
                  ToastUtil.show(context,
                      SharedLocalizations.of(context)!.shareToFeedSuccess,
                      status: ToastStatus.success);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: appBar(),
        bottomNavigationBar: bottomWidget(),
        body: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    userPost(),
                    genInfoShareToFeed(widget.model.dagObjectName)
                  ],
                ),
              ),
            )
        ));
  }
}

class ItemDropDown {
  final String name;
  final String icon;

  ItemDropDown(this.name, this.icon);
}

enum DagObjectName {
  FOOD_SHARE,
  PRODUCT_SHARE,
  SHOP_SHARE,
  RESTAURANT_SHARE,
  HOTEL_SHARE,
  TOUR_SHARE_OBJECT
}

enum ShareLinkType { Food, Product, Shop, Restaurant, Hotel, Tour }
