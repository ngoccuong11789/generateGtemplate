part of 'query_builder.dart';

class MultipleValueSelected extends ValueSelected {
  MultipleValueSelected._(String operator, String value, QueryBuilder builder,
      {bool sensitive = true})
      : super._(sensitive ? operator : "$operator*", value, builder);

  MultipleValueSelected or(String value) {
    _builder._next.values!.add(value);
    return this;
  }
}
