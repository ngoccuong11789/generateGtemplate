import 'package:equatable/equatable.dart';
// fullName
// email,
// phoneNumber,
// idCard,

class UserModel extends Equatable {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String idCard;

  const UserModel({
    this.fullName = "",
    this.email = "",
    this.phoneNumber = "",
    this.idCard = "",
  });

  UserModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? idCard,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      idCard: idCard ?? this.idCard,
    );
  }

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
        idCard,
      ];
}
