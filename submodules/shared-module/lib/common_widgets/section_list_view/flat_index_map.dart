part of '../section_list_view.dart';

class FlatIndexMap {
  final SectionItemCount sectionItemCount;
  late int _sectionCount;
  late List<int> _countSum;

  FlatIndexMap(this.sectionItemCount) {
    _sectionCount = sectionItemCount.sectionCount;
    int singleSum = 0;
    _countSum = List.generate(_sectionCount,
        (index) => singleSum = singleSum + sectionItemCount.getItemCount(index),
        growable: false);
  }

  int getFlatIndex(int sectionIndex, int itemIndex) {
    if (sectionIndex == 0) {
      return itemIndex;
    }
    final previousSum = _countSum[sectionIndex - 1];
    return itemIndex + previousSum;
  }

  int get flatCount => _countSum.lastOrNull ?? 0;

  SectionItemIndex getSectionItemIndex(int flatIndex) {
    if (flatIndex < _countSum.first) {
      return SectionItemIndex(0, flatIndex);
    }
    if (flatIndex == _countSum.last) {
      return SectionItemIndex(_sectionCount - 1, 0);
    }

    //Do a binary search
    int left = 0;
    int right = _countSum.length - 1;

    while (right - left > 1) {
      int center = ((left + right) / 2).floor();
      if (flatIndex == _countSum[center]) {
        return SectionItemIndex(center + 1, 0);
      }

      if (flatIndex < _countSum[center]) {
        right = center;
      } else {
        left = center;
      }
    }

    return SectionItemIndex(right, flatIndex - _countSum[right - 1]);
  }
}
