
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_module/common_widgets/section_list_view.dart';

main() {
  group("Flat index Map with sample  data", () {
    FlatIndexMap map = FlatIndexMap(SectionItemCount.fromList(const [3,6,2,3,10]));
    // 0,1,2
    // 3,4,5,6,7,8,
    // 9, 10
    // 11, 12, 13
    // ...
    test("total", () {
      expect(map.flatCount,24);
    });

    // section, item, flat
    final cases = [
      [1,5,8],
      [0,1,1],
      [0,0,0],
      [3,2,13],
      [3,0,11],
      [2,1,10],
      [4,0,14],
      [4,9,23]
    ];

    for(final caze in cases){
      test("getFlatIndex case $caze", () {
        expect(map.getFlatIndex(caze[0],caze[1]),caze[2]);
      });

      test("getSectionItemIndex case $caze", () {
        expect(map.getSectionItemIndex(caze[2]),SectionItemIndex(caze[0], caze[1]));
      });
    }
  });

  group("Flat index Map with all 1", () {
    FlatIndexMap map = FlatIndexMap(SectionItemCount.allOne(4));

    test("total", () {
      expect(map.flatCount, 4);
    });
    for (int i = 0; i < 4; i++) {
      test("i=$i", () {
        expect(map.getFlatIndex(i,0),i);
        expect(map.getSectionItemIndex(i),SectionItemIndex(i, 0));
      });
    }
  });
}