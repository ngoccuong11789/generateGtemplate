import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

typedef CurrencyComponentGenerator<T> = T Function(String);
typedef TextSpanGenerator = TextSpan Function(String);
typedef CurrencyWidgetBuilder = Widget Function(String);

mixin LocalizationHelper {
  abstract final String localeName;

  String plural(num howMany,
      {String? zero,
      String? one,
      String? two,
      String Function(String count)? few,
      String Function(String count)? many,
      required String Function(String count) other}) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(howMany);
    final otherString = other(countString);
    final String? manyString;
    if (many != null) {
      manyString = many(countString);
    } else {
      manyString = null;
    }
    final String? fewString;
    if (few != null) {
      fewString = few(countString);
    } else {
      fewString = null;
    }

    return intl.Intl.pluralLogic(
      howMany,
      locale: localeName,
      other: otherString,
      many: manyString,
      few: fewString,
      two: two,
      one: one,
      zero: zero,
    );
  }
  final select = intl.Intl.selectLogic;

  String compactCurrency(num value, {String? name, int? decimalDigits}) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.compactCurrency(
        locale: localeName,
        name: name,
        decimalDigits: decimalDigits
    );
    return valueNumberFormat.format(value);
  }

  String compact(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.compact(locale: localeName);
    return valueNumberFormat.format(value);
  }
  String compactSimpleCurrency(num value, {String? name, int? decimalDigits}) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.compactSimpleCurrency(
            locale: localeName,
            name: name,
            decimalDigits: decimalDigits );
    return valueNumberFormat.format(value);
  }

  String currency(num value,
      {String? name,
      String? symbol,
      int? decimalDigits,
      String? customPattern}) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.currency(
        locale: localeName,
        name: name,
        symbol: symbol,
        decimalDigits: decimalDigits,
        customPattern: customPattern);
    return valueNumberFormat.format(value);
  }

  /// create list of [TextSpan] which are formatted to match the current local.
  /// Note: This method currently doesn't support separated negative span format.
  List<TextSpan> currencySpan(num value,
      {String? name,
      String? symbol,
      int? decimalDigits,
      TextSpanGenerator? amountSpan,
      TextSpanGenerator? spaceSpan,
      TextSpanGenerator? symbolSpan,
      bool forceAddSpace = false
      }) {
    return _currencyGenerate(value,
        name: name,
        symbol: symbol,
        decimalDigits: decimalDigits,
        defaultGenerator: (text) => TextSpan(text: text),
        amountGenerator: amountSpan,
        spaceGenerator: spaceSpan,
        symbolGenerator: symbolSpan,
        forceAddSpace: forceAddSpace);
  }

  /// create list of [Widget] which are formatted to match the current local.
  /// Note: This method currently doesn't support separated negative widget format.
  List<Widget> currencyWidget(num value,
      {String? name,
      String? symbol,
      int? decimalDigits,
      CurrencyWidgetBuilder? amountBuilder,
      CurrencyWidgetBuilder? spaceBuilder,
      CurrencyWidgetBuilder? symbolBuilder,
      bool forceAddSpace = false}) {
    return _currencyGenerate(value,
        name: name,
        symbol: symbol,
        decimalDigits: decimalDigits,
        defaultGenerator: (text) => Text(text),
        amountGenerator: amountBuilder,
        spaceGenerator: spaceBuilder,
        symbolGenerator: symbolBuilder,
        forceAddSpace: forceAddSpace);
  }

  List<T> _currencyGenerate<T>(num value,
      {String? name,
      String? symbol,
      int? decimalDigits,
      required CurrencyComponentGenerator<T> defaultGenerator,
      CurrencyComponentGenerator<T>? amountGenerator,
      CurrencyComponentGenerator<T>? spaceGenerator,
      CurrencyComponentGenerator<T>? symbolGenerator,
      bool forceAddSpace = false}) {
    symbol = symbol ?? (name == null ? null : currencySymbol(name));
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.currency(
        locale: localeName,
        name: name,
        symbol: symbol,
        decimalDigits: decimalDigits);
    String valueString = valueNumberFormat.format(value);
    String symbolString = valueNumberFormat.currencySymbol;
    if (forceAddSpace) {
      valueString = valueString.replaceAllMapped(
          RegExp("\\s*${RegExp.escape(symbolString)}\\s*"), (match) {
        return " ${match.group(0)} ";
      }).trim();
    }
    List<String> tokens = valueString.split(symbolString);

    T createComponent(CurrencyComponentGenerator? generator, String text) {
      return (generator?.call(text)) ?? defaultGenerator(text);
    }

    List<T> createAmountComponents(String text) {
      if (spaceGenerator == null) {
        return [createComponent(amountGenerator, text)];
      }
      final regex = RegExp('(^\\s*)(.*[^\\s])(\\s*\$)');
      final matcher = regex.firstMatch(text);
      if (matcher == null) {
        return [createComponent(amountGenerator, text)];
      }
      String? start = matcher.group(1);
      String? middle = matcher.group(2);
      String? end = matcher.group(3);
      List<T> result = [];
      if ((start?.length ?? 0) > 0) {
        result.add(createComponent(spaceGenerator, start!));
      }
      if ((middle?.length ?? 0) > 0) {
        result.add(createComponent(amountGenerator, middle!));
      }
      if ((end?.length ?? 0) > 0) {
        result.add(createComponent(spaceGenerator, end!));
      }
      return result;
    }

    if (tokens.length == 2) {
      List<T> result = [];
      if (tokens[0].isNotEmpty) {
        result.addAll(createAmountComponents(tokens[0]));
      }
      if (symbolString.isNotEmpty) {
        result.add(createComponent(symbolGenerator, symbolString));
      }
      if (tokens[1].isNotEmpty) {
        result.addAll(createAmountComponents(tokens[1]));
      }
      return result;
    } else {
      return [createComponent(amountGenerator, valueString)];
    }
  }

  String currencySymbol(String name) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.simpleCurrency(locale: localeName, name: name);
    return valueNumberFormat.currencySymbol;
  }

  String compactLong(num value, {explicitSign = false}) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.compactLong(
        locale: localeName,
        explicitSign: explicitSign
    );
    return valueNumberFormat.format(value);
  }

  String decimalPattern(num value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    return valueNumberFormat.format(value);
  }

  String decimalPatternDigits(num value, int numberOfDigits) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: numberOfDigits);
    return valueNumberFormat.format(value);
  }

  String decimalPercentPattern(num value, {int? decimalDigits}) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPercentPattern(locale: localeName, decimalDigits: decimalDigits);
    return valueNumberFormat.format(value);
  }

  String percentPattern(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.percentPattern(localeName);
    return valueNumberFormat.format(value);
  }

  String scientificPattern(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.scientificPattern(localeName);
    return valueNumberFormat.format(value);
  }

  String simpleCurrency(num value, {String? name, int? decimalDigits}) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.simpleCurrency(
            locale: localeName, name: name, decimalDigits: decimalDigits);
    return valueNumberFormat.format(value);
  }

  String dateTime(DateTime datetime, [String? format]) {
    final locale = localeName;
    return intl.DateFormat(format, locale).format(datetime);
  }
}
