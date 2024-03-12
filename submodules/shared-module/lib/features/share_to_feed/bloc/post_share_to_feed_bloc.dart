import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/features/auth/auth_tokens_manager.dart';
import 'package:shared_module/features/share_to_feed/api/post_controller.dart';
import 'package:shared_module/features/share_to_feed/model/post_dto.dart';
import 'package:shared_module/features/share_to_feed/view/share_to_feed_page.dart';
import 'package:shared_module/models/auth_model.dart';
import 'package:shared_module/shared_module.dart';

import '../../auth/auth_controller.dart';

part 'post_share_to_feed_event.dart';
part 'post_share_to_feed_state.dart';

class PostShareToFeedBloc
    extends Bloc<PostShareToFeedEvent, PostShareToFeedState> {
  final PostController myCartController =
      PostController(SharedModule.appDelegates!.dio);
  final authController = AuthController.instance;
  PostShareToFeedBloc() : super(LoadingData()) {
    on<PostAction>(((event, emit) async {
      PostDto dto = PostDto(
          content: event.content,
          postType: "User",
          postPrivacy: event.postPrivacy,
          friendTags: [],
          shareLink: "",
          shareLinkType: event.shareLinkType.name,
          dagObjectName: event.dagObjectName.name,
          dagObjectId: event.dagObjectId);
      var data = await myCartController.postShareToFeed(dto);
    }));

    on<GetUser>(((event, emit) async {
      final AuthModel user;
      String? authModel = await authController.tokensManager
          .loadMetaData(AuthTokensManager.authModel);
      if (authModel != null) {
        user = AuthModel.fromJson(json.decode(authModel));
        emit(state.copyWith(user: user));
      }
    }));
  }
}
