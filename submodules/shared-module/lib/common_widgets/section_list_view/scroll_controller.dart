part of '../section_list_view.dart';

class SectionListScrollController extends ChangeNotifier {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
  ItemPositionsListener.create();
  Iterable<ItemPosition>? _oldValue;
  int _flatIndex = 0;

  int get flatIndex => _flatIndex;

  Iterable<ItemPosition>? get itemPositions => _itemPositionsListener.itemPositions.value;

  FlatIndexMap? _indexMap;

  SectionListScrollController() {
    _itemPositionsListener.itemPositions.addListener(_onItemPositionUpdated);
  }

  @override
  void dispose() {
    super.dispose();
    _itemPositionsListener.itemPositions.removeListener(_onItemPositionUpdated);
  }

  // Note: itemPositionsListener.itemPositions.addListener has a bug that
  // invoke the listener every time the widget update (even without scroll).
  // So I use sequentiallyEquals to detect and reject the incorrect invoke
  void _onItemPositionUpdated() {
    final newValue = _itemPositionsListener.itemPositions.value;
    if (CollectionUtil.sequentiallyEquals(_oldValue, newValue)) {
      return;
    }
    _oldValue = newValue;
    _onItemPositionChange(_itemPositionsListener.itemPositions.value);
  }

  void _onItemPositionChange(Iterable<ItemPosition> value) {
    final itemPositions =
    value.where((e) => e.itemLeadingEdge >= 0).map((e) => e.index);
    if (itemPositions.isNotEmpty) {
      _flatIndex =
          itemPositions.reduce((value, element) => min(value, element));
    }
    notifyListeners();
  }

  scrollToFlatItem({
    required int index,
    double alignment = 0,
    required Duration duration,
    Curve curve = Curves.linear,
    List<double> opacityAnimationWeights = const [40, 20, 40],
  }) {
    _itemScrollController.scrollTo(
        index: index,
        duration: duration,
        curve: curve,
        opacityAnimationWeights: opacityAnimationWeights);
  }

  scrollTo({
    required int section,
    required int item,
    double alignment = 0,
    required Duration duration,
    Curve curve = Curves.linear,
    List<double> opacityAnimationWeights = const [40, 20, 40],
  }) {
    final index = _requireIndexMap().getFlatIndex(section, item);

    _itemScrollController.scrollTo(
        index: index,
        duration: duration,
        alignment: alignment,
        curve: curve,
        opacityAnimationWeights: opacityAnimationWeights);
  }

  FlatIndexMap _requireIndexMap() {
    if (_indexMap == null) {
      throw StateError(
          "You should pass this SectionListScrollController to SectionListView to be able to use it");
    }
    return _indexMap!;
  }

  SectionItemIndex get itemIndex =>
      _requireIndexMap().getSectionItemIndex(_flatIndex);
}
