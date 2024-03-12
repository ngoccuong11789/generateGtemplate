part of 'query_builder.dart';

class FieldSelected with _Operators {
  @override
  final QueryBuilder _builder;

  FieldSelected._(String fieldName, this._builder) {
    _builder._next.fields = [fieldName];
  }

  FieldSelected orField(String fieldName) {
    _builder._next.fields!.add(fieldName);
    return this;
  }
}
