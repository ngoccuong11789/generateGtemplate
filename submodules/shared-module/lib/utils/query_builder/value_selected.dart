part of 'query_builder.dart';

class ValueSelected implements FieldCriteriaProvider {
  final QueryBuilder _builder;

  ValueSelected._(String operator, String value, this._builder) {
    _builder._next.operator = operator;
    _builder._next.values = [value];
  }

  QueryBuilder then() {
    _builder._criteriaList.add(_builder._next);
    _builder._next = _Criteria();
    return _builder;
  }

  @override
  _Criteria get _criteria => _builder._next;
}
