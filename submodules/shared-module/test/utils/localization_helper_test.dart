import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_module/util.dart';

class AloneLocalizationHelper with LocalizationHelper {
  AloneLocalizationHelper({this.localeName = "en"});
  @override
  String localeName;
}

void main() {

  group("test currencySpan", () {
    List<Map<String, dynamic>> cases = [
      {"lang":"en", "amount": 1000, "name": "VND", "symbol": "₫", "expect": ["₫", "1,000"]},
      {"lang":"vi", "amount": 1000, "name": "VND", "symbol": "₫", "expect": ["1.000", " ", "₫"]},
      {"lang":"en", "amount": 1000, "name": "VND", "symbol": null, "expect": ["VND", "1,000"]},
      {"lang":"vi", "amount": 1000, "name": "VND", "symbol": null, "expect": ["1.000", " ", "VND"]},
      {"lang":"en", "amount": 1000, "name": "USD", "symbol": "\$", "expect": ["\$", "1,000.00"]},
      {"lang":"vi", "amount": 1000, "name": "USD", "symbol": "\$", "expect": ["1.000,00", " ", "\$"]},
    ];

    for (final item in cases) {
      test("Case: lang = ${item["lang"]}, symbol = ${item["symbol"]}", () {
        final helper = AloneLocalizationHelper(localeName: item["lang"]);
        final spans = helper.currencySpan(item["amount"],
            name: item["name"],
            symbol: item["symbol"],
            spaceSpan: (text) => TextSpan(text: text)
        );
        expect(spans.map((span) => span.text).toList(growable: false),
            item["expect"]);
      });
    }
  });

  test("simple currency", () {
    final helper = AloneLocalizationHelper();
    final result = helper.simpleCurrency(1000);
    expect(result, "\$1,000.00");
  });

  test("test currencySpan Ignore space separation", () {
    final helper = AloneLocalizationHelper(localeName: "vi");
    final spans = helper.currencySpan(1000, name: "VND");
    expect(spans.map((span) => span.text).toList(growable: false),
        ["1.000 ", "VND"]);
  });

  test("test currencySpan without symbol", () {
    final helper = AloneLocalizationHelper(localeName: "en");
    final spans = helper.currencySpan(1000, name: "VND", symbol: "");
    expect(spans.map((span) => span.text).toList(growable: false),
        ["1,000"]);
  });
}