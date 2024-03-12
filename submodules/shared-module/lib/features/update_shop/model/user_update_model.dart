import 'package:equatable/equatable.dart';

class UserModelUpdate extends Equatable {
  final String fullName;
  final String email;
  final String phoneNumber;

  const UserModelUpdate({
    this.fullName = "",
    this.email = "",
    this.phoneNumber = "",
  });

  UserModelUpdate copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? idCard,
  }) {
    return UserModelUpdate(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    email,
    phoneNumber,
  ];
}
