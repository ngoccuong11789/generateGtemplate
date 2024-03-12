part of 'query_builder.dart';

abstract mixin class _Operators {
  QueryBuilder get _builder;

  MultipleValueSelected equal(String value, {bool caseSensitive = true}) {
    return MultipleValueSelected._("==", value, _builder,
        sensitive: caseSensitive);
  }

  MultipleValueSelected doNotEqual(String value, {bool caseSensitive = true}) {
    return MultipleValueSelected._("!=", value, _builder,
        sensitive: caseSensitive);
  }

  ValueSelected greaterThan(String value) {
    return ValueSelected._(">", value, _builder);
  }

  ValueSelected greaterThanOrEqual(String value) {
    return ValueSelected._(">=", value, _builder);
  }

  ValueSelected lessThan(String value) {
    return ValueSelected._("<", value, _builder);
  }

  ValueSelected lessThanOrEqual(String value) {
    return ValueSelected._("<", value, _builder);
  }

  MultipleValueSelected contain(String value, {bool caseSensitive = true}) {
    return MultipleValueSelected._("@=", value, _builder,
        sensitive: caseSensitive);
  }

  ValueSelected inRange(String from, String to) {
    return ValueSelected._("@~", "$from:$to", _builder);
  }

  MultipleValueSelected startWith(String value, {bool caseSensitive = true}) {
    return MultipleValueSelected._("_=", value, _builder,
        sensitive: caseSensitive);
  }

  MultipleValueSelected endWith(String value, {bool caseSensitive = true}) {
    return MultipleValueSelected._("_-=", value, _builder,
        sensitive: caseSensitive);
  }

  MultipleValueSelected doNotStartWith(String value,
      {bool caseSensitive = true}) {
    return MultipleValueSelected._("!_=", value, _builder,
        sensitive: caseSensitive);
  }

  MultipleValueSelected doNotEndWith(String value,
      {bool caseSensitive = true}) {
    return MultipleValueSelected._("!_-=", value, _builder,
        sensitive: caseSensitive);
  }

  MultipleValueSelected doNotContain(String value,
      {bool caseSensitive = true}) {
    return MultipleValueSelected._("!@=", value, _builder,
        sensitive: caseSensitive);
  }
}
