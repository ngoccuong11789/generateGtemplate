import 'package:flutter/foundation.dart';

part 'field.dart';
part 'field_selected.dart';
part 'value_selected.dart';
part 'multiple_value_selected.dart';
part 'criteria.dart';
part 'field_criteria_provider.dart';
part 'operators.dart';

/// Search and filter query builder for soctrip project,
/// based on https://gitlab.tma.com.vn/soctrip-development/soctrip-wikipedia/-/wikis/Designs/Advanced-Search-How-to
/// You might need to look at example and example2 for example code.
class QueryBuilder {

  QueryBuilder();

  static void example() {
    final String  query = QueryBuilder()
        .field("company").equal("TMA", caseSensitive: false)
        .then()
        .field("name").orField("about").contain("diep").or("vo")
        .then()
        .field("age").greaterThan("18")
        .then()
        .build();
    debugPrint(query);
  }

  static void example2() {
    String keyword = "";
    final String query = QueryBuilder()
        .criteria(Field("company").equal("TMA", caseSensitive: false))
        .criteria(Field("name").orField("about").contain("diep").or("vo"))
        .criteria(Field("age").greaterThan("18"))
        .criteria(Field("content").contain(keyword, caseSensitive: false),
            onlyIf: keyword.isNotEmpty)
        .build();

    debugPrint(query);
  }

  final List<_Criteria> _criteriaList = [];

  // ignore: prefer_final_fields
  _Criteria _next = _Criteria();

  FieldSelected field(String fieldName) {
    return FieldSelected._(fieldName, this);
  }

  QueryBuilder criteria(FieldCriteriaProvider criteriaProvider,
      {bool onlyIf = true}) {
    if (onlyIf) {
      _criteriaList.add(criteriaProvider._criteria);
    }
    return this;
  }

  String build() {
    StringBuffer stringBuffer = StringBuffer();
    for (final criteria in _criteriaList) {
      if (stringBuffer.length > 0) {
        stringBuffer.write(",");
      }

      _writeFields(criteria.fields!, stringBuffer);

      stringBuffer.write(criteria.operator);

      _writeValues(criteria.values!, stringBuffer);
    }
    return stringBuffer.toString();
  }

  String encode() {
    var result = build();
    result = Uri.encodeComponent(result);
    return result;
  }

  void _writeFields(List<String> fields, StringBuffer stringBuffer) {
    if (fields.length == 1) {
      stringBuffer.write(fields.first);
    } else {
      stringBuffer.write("(");
      for (int i = 0; i < fields.length; i++) {
        if (i > 0) {
          stringBuffer.write("|");
        }
        stringBuffer.write(fields[i]);
      }
      stringBuffer.write(")");
    }
  }

  void _writeValues(List<String> values, StringBuffer stringBuffer) {
    for (int i = 0; i < values.length; i++) {
      if (i > 0) {
        stringBuffer.write("|");
      }
      stringBuffer.write(values[i]);
    }
  }
}
