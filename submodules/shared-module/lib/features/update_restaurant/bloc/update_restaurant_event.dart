part of 'update_restaurant_bloc.dart';

sealed class UpdateRestaurantEvent extends Equatable {
  const UpdateRestaurantEvent();
}

class HandleGetRestaurantInfo extends UpdateRestaurantEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeInputFieldRestaurant extends UpdateRestaurantEvent {

  final RestaurantModel restaurantModel;

  const ChangeInputFieldRestaurant(this.restaurantModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HandleGetListCountries extends UpdateRestaurantEvent{
  const HandleGetListCountries();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedCountries extends UpdateRestaurantEvent{
  final Countries countries;

  const HandleSelectedCountries({required this.countries});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedProvinces extends UpdateRestaurantEvent{
  final Provinces provinces;

  const HandleSelectedProvinces({required this.provinces});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedDistrict extends UpdateRestaurantEvent{
  final District district;

  const HandleSelectedDistrict({required this.district});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HandleGetListCategory extends UpdateRestaurantEvent {
  const HandleGetListCategory();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ChangeCategory extends UpdateRestaurantEvent {
  const ChangeCategory({required this.index});

  final int index;

  @override
  List<Object?> get props => [];
}

class DeleteCategory extends UpdateRestaurantEvent {
  const DeleteCategory({required this.category});

  final Category category;

  @override
  List<Object?> get props => [];
}

class ChangeTimes extends UpdateRestaurantEvent {
  const ChangeTimes({required this.opening, required this.newTime});

  final bool opening;
  final TimeOfDay? newTime;

  @override
  List<Object?> get props => [];
}

class UpdateRestaurant extends UpdateRestaurantEvent{
  final String name;
  final Countries country;
  final Provinces? province;
  final District district;
  final String street;
  final String subStreet;
  final List<String> restaurantTypeIds;
  final List<String> restaurantTypes;
  final String ownerName;
  final String email;
  final String phone;
  final String idCard;
  final DateTime openTime;
  final DateTime closedTime;

  const UpdateRestaurant(
      this.name,
      this.country,
      this.province,
      this.district,
      this.street,
      this.subStreet,
      this.restaurantTypeIds,
      this.restaurantTypes,
      this.ownerName,
      this.email,
      this.phone,
      this.idCard,
      this.openTime,
      this.closedTime);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

