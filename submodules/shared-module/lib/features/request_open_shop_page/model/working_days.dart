import 'package:equatable/equatable.dart';

class WorkingDays extends Equatable {
  final List<bool> indexList;
  final List<String> days;
  const WorkingDays({
    this.indexList = const [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ],
    this.days = const [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ],
  });

  WorkingDays copyWith({
    List<bool>? indexList,
  }) {
    return WorkingDays(
      indexList: indexList ?? this.indexList,
    );
  }

  @override
  List<Object?> get props => [indexList];
}
