import 'package:flutter/cupertino.dart';

class ScrollControllerHelper {
  ScrollController loadMore(
      {required void Function() listener,
      required bool loading,
      endThresholdReached = 100}) {
    ScrollController scrollController = ScrollController();
    onScroll() {
      if (!scrollController.hasClients || loading) return;

      final thresholdReached =
          scrollController.position.extentAfter < endThresholdReached;
      if (thresholdReached) {
        listener();
      }
    }

    scrollController.addListener(onScroll);
    return scrollController;
  }
}
