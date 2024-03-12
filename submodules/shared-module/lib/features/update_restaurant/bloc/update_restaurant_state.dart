part of 'update_restaurant_bloc.dart';

class Optional<T> {
  final T? value;
  Optional.of(this.value);
  Optional.empty(): value = null;
}

class UpdateRestaurantState extends Equatable {

  final List<Countries>? listCountries;
  final Countries? selectedCountries;
  final List<Provinces>? listProvinces;
  final Provinces? selectedProvince;
  final List<District>? listDistrict;
  final District? selectedDistrict;
  final List<Category>? listCategory;
  final RestaurantModel restaurantModel;
  final UserModel userModel;
  final SelectCategory selectCategory;
  final TimeOfDay openingTime;
  final TimeOfDay closedTime;


  const UpdateRestaurantState({
    this.listCountries,
    this.selectedCountries,
    this.listProvinces,
    this.selectedProvince,
    this.listDistrict,
    this.selectedDistrict,
    this.listCategory,
    this.restaurantModel = const RestaurantModel(),
    this.userModel = const UserModel(),
    this.selectCategory = const SelectCategory(),
    this.openingTime = const TimeOfDay(hour: 0, minute: 0),
    this.closedTime = const TimeOfDay(hour: 0, minute: 0),
  });

  T? getValue<T>(Optional<T>? optional, T? defaultValue) {
    if (optional == null) {
      return defaultValue;
    } else {
      return optional.value;
    }
  }

  UpdateRestaurantState copyWith({
    Optional<List<Countries>>? listCountries,
    Optional<Countries>? selectedCountries,
    Optional<List<Provinces>>? listProvinces,
    Optional<Provinces>? selectedProvince,
    Optional<List<District>>? listDistrict,
    Optional<District>? selectedDistrict,
    List<Category>? listCategory,
    RestaurantModel? restaurantModel,
    UserModel? userModel,
    SelectCategory? selectCategory,
    TimeOfDay? openingTime,
    TimeOfDay? closedTime,
  }) {
    return UpdateRestaurantState(
      listCountries:  getValue(listCountries, this.listCountries),
      selectedCountries: getValue(selectedCountries, this.selectedCountries),
      listProvinces: getValue(listProvinces, this.listProvinces),
      selectedProvince: getValue(selectedProvince, this.selectedProvince),
      listDistrict: getValue(listDistrict, this.listDistrict),
      selectedDistrict: getValue(selectedDistrict, this.selectedDistrict),
      listCategory: listCategory ?? this.listCategory,
      restaurantModel: restaurantModel ?? this.restaurantModel,
      userModel: userModel ?? this.userModel,
      selectCategory: selectCategory ?? this.selectCategory,
      openingTime: openingTime ?? this.openingTime,
      closedTime: closedTime ?? this.closedTime,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    listCountries,
    selectedCountries,
    listProvinces,
    selectedProvince,
    listDistrict,
    selectedDistrict,
    listCategory,
    restaurantModel,
    userModel,
    selectCategory,
    openingTime,
    closedTime,
  ];
}