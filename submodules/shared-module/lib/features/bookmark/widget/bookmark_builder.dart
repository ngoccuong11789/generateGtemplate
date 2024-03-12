import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/bookmark/bloc/bookmark_bloc.dart';
import 'package:shared_module/features/bookmark/model/bookmark_type.dart';
import 'package:shared_module/utils/bookmark_util.dart';

typedef ToggleBookmark = void Function();

typedef BookmarkIconWidgetBuilder = Widget Function(
    BuildContext context, bool isActive, ToggleBookmark toggle);

class BookmarkIconBuilder extends StatelessWidget {
  final BookmarkIconWidgetBuilder builder;
  final bool initialIsActive;
  final String objectId;
  final BookmarkType type;
  final String? groupId;
  final String? groupName;

  const BookmarkIconBuilder(
      {super.key,
        required this.builder,
        this.initialIsActive = false,
        required this.objectId,
        required this.type,
        this.groupId,
        this.groupName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkBloc, BookmarkState>(
        builder: (context, BookmarkState state) {
          return FutureBuilder(
              initialData: initialIsActive,
              future: BookmarkUtil.isBookmarked(context, objectId),
              builder: (context, snapshot) {
                final active = snapshot.data ?? false;
                return builder(context, active, () {
                  if (active) {
                    context.read<BookmarkBloc>().add(RemoveBookmark(objectId));
                  } else {
                    context.read<BookmarkBloc>().add(AddBookmark(objectId, type, groupId, groupName));
                  }
                });
              });
        });
  }
}
