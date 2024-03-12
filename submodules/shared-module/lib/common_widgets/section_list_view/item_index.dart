part of '../section_list_view.dart';

class SectionItemIndex extends Equatable {
  final int sectionIndex;
  final int itemIndex;

  const SectionItemIndex(this.sectionIndex, this.itemIndex);

  @override
  List<Object?> get props => [sectionIndex, itemIndex];
}