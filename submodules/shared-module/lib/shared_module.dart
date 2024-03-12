import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/app_delegates.dart';
import 'package:shared_module/features/bookmark/bloc/bookmark_bloc.dart';

export 'localization/localizations.dart';
export 'shared_widgets.dart';
export 'enum/toast_status.dart';
export 'app_delegates.dart';
export 'global_config.dart';
export 'mini_app.dart';

class SharedModule {
  static AppDelegates? appDelegates;

  static List<dynamic> createSharedBlocProviders() {
    return [
      BlocProvider(create: (_) => BookmarkBloc()..add(const LoadBookmark())),
    ];
  }
}
