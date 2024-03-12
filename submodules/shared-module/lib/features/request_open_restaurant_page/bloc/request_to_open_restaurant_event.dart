part of 'request_to_open_restaurant_bloc.dart';

sealed class RequestToOpenRestaurantEvent extends Equatable {
  const RequestToOpenRestaurantEvent();
}

class HandleGetListCountries extends RequestToOpenRestaurantEvent {
  const HandleGetListCountries();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedCountries extends RequestToOpenRestaurantEvent {
  final Countries countries;

  const HandleSelectedCountries({required this.countries});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedProvinces extends RequestToOpenRestaurantEvent {
  final Provinces provinces;

  const HandleSelectedProvinces({required this.provinces});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedDistrict extends RequestToOpenRestaurantEvent {
  final District district;

  const HandleSelectedDistrict({required this.district});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ChangeInputFieldRestaurant extends RequestToOpenRestaurantEvent {

  final RestaurantModel restaurantModel;

  const ChangeInputFieldRestaurant(this.restaurantModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ChangeInputFieldUser extends RequestToOpenRestaurantEvent {
  final UserModel userModel;

  const ChangeInputFieldUser(this.userModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleGetUserInformation extends RequestToOpenRestaurantEvent {
  const HandleGetUserInformation();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleGetListCategory extends RequestToOpenRestaurantEvent {
  const HandleGetListCategory();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ChangeCategory extends RequestToOpenRestaurantEvent {
  const ChangeCategory({required this.index});

  final int index;

  @override
  List<Object?> get props => [];
}

class DeleteCategory extends RequestToOpenRestaurantEvent {
  const DeleteCategory({required this.category});

  final Category category;

  @override
  List<Object?> get props => [];
}

class ChangeTimes extends RequestToOpenRestaurantEvent {
  const ChangeTimes({required this.opening, required this.newTime});

  final bool opening;
  final TimeOfDay? newTime;

  @override
  List<Object?> get props => [];
}

class SendRequest extends RequestToOpenRestaurantEvent {
  final String name;
  final Countries country;
  final Provinces province;
  final District district;
  final String street;
  final String subStreet;
  final List<String> restaurantTypeIds;
  final List<String> restaurantTypes;
  final String ownerName;
  final String email;
  final String phone;
  final String idCard;
  final TimeOfDay openTime;
  final TimeOfDay closedTime;


  const SendRequest(this.name, this.country, this.province, this.district,
      this.street, this.subStreet, this.restaurantTypeIds, this.restaurantTypes,
      this.ownerName, this.email, this.phone, this.idCard, this.openTime,
      this.closedTime);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

