import 'package:equatable/equatable.dart';

class ItemFilterContent extends Equatable {
  final String content;
  final String id;

  const ItemFilterContent({required this.content, required this.id});

  @override
  List<Object?> get props => [id];
}
