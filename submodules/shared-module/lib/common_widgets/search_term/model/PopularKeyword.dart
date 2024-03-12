import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PopularKeyword.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PopularKeyword  extends Equatable{
  const PopularKeyword({
    required this.storage,
  });

  final Map<String, String> storage;

  factory PopularKeyword.fromJson(Map<String, dynamic> json) =>
      _$PopularKeywordFromJson(json);

  Map<String, dynamic> toJson() => _$PopularKeywordToJson(this);

  @override
  List<Object?> get props =>[storage];
}
