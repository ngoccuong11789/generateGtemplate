import 'package:equatable/equatable.dart';

class LocationDetails extends Equatable {
  final String id;
  final String name;
  final String address;

  LocationDetails(
      {required this.id, required this.name, required this.address});

  @override
  List<Object?> get props => [id];
}

class MyLocation extends LocationDetails {
  final double longitude;
  final double latitude;

  MyLocation({required this.longitude, required this.latitude})
      : super(id: "", name: "", address: "");

  @override
  List<Object?> get props => [longitude, latitude];
}
