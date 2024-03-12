import 'package:equatable/equatable.dart';

enum InputPlace { city, district, ward }

class CityDistrictWard extends Equatable {
  final InputPlace inputPlace;
  final List<String> list;
  final int index;

  const CityDistrictWard({
    required this.inputPlace,
    this.list = const [],
    this.index = -1,
  });

  CityDistrictWard copyWith({
    List<String>? list,
    int? index,
  }) {
    return CityDistrictWard(
      inputPlace: inputPlace,
      list: list ?? this.list,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [
        inputPlace,
        list,
        index,
      ];
}
