part of '../section_list_view.dart';

abstract class SectionItemCount extends Equatable {
  const SectionItemCount();

  int get sectionCount;

  int getItemCount(int sectionIndex);

  factory SectionItemCount.fromList(List<int> itemCount) {
    return _SectionItemCountList(itemCount);
  }

  factory SectionItemCount.allOne(int sectionCount) {
    return _SectionAll1Item(sectionCount);
  }
}

class _SectionItemCountList extends SectionItemCount {
  final List<int> itemCount;

  const _SectionItemCountList(this.itemCount);

  @override
  int getItemCount(int sectionIndex) {
    return itemCount[sectionIndex];
  }

  @override
  int get sectionCount => itemCount.length;

  @override
  List<Object?> get props => [itemCount];
}

class _SectionAll1Item extends SectionItemCount {
  @override
  final int sectionCount;

  const _SectionAll1Item(this.sectionCount);

  @override
  int getItemCount(int sectionIndex) => 1;

  @override
  List<Object?> get props => [sectionCount];
}
