import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:soctrip_icons/soctrip_icons.dart' as soctrip;

void main() {
  testWidgets("test SoctripIcon", (tester) async {
    const icon = soctrip.SoctripIcon(soctrip.Icons.airpods);
    await tester.pumpWidget(const MaterialApp(
      home: icon,
    ));
    expect(find.text(soctrip.Icons.airpods.code),findsOneWidget);
  });

  test("test SoctripIconSpan", (){
    final span = soctrip.SoctripIconSpan(soctrip.Icons.calculator);
    expect(
        span.toPlainText(
            includeSemanticsLabels: false, includePlaceholders: false),
        soctrip.Icons.calculator.code);
  });
}
