import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/bookmark/bloc/bookmark_bloc.dart';

class BookmarkUtil {
  static Future<bool> isBookmarked(
      BuildContext context, String objectId) async {
    final bloc = BlocProvider.of<BookmarkBloc>(context);
    final include = await bloc.bloomService.has(objectId);
    if (include) {
      return bloc.controller.checkIfBookmarked(objectId);
    }
    return false;
  }
}
