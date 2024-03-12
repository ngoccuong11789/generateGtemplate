part of 'update_shop_bloc.dart';

class Optional<T> {
  final T? value;
  Optional.of(this.value);
  Optional.empty(): value = null;
}

class UpdateShopState extends Equatable {
  final bool isInvoiceExact;
  final List<Countries>? listCountries;
  final Countries? selectedCountries;
  final List<Provinces>? listProvinces;
  final Provinces? selectedProvince;
  final List<District>? listDistrict;
  final District? selectedDistrict;
  final ShopModelUpdate shopModelUpdate;
  final UserModelUpdate userModelUpdate;

  const UpdateShopState({
    this.isInvoiceExact = false,
    this.listCountries,
    this.selectedCountries,
    this.listProvinces,
    this.selectedProvince,
    this.listDistrict,
    this.selectedDistrict,
    this.shopModelUpdate = const ShopModelUpdate(),
    this.userModelUpdate = const UserModelUpdate(),
  });

  T? getValue<T>(Optional<T>? optional, T? defaultValue) {
    if (optional == null) {
      return defaultValue;
    } else {
      return optional.value;
    }
  }

  UpdateShopState copyWith({
    bool? isInvoiceExact,
    Optional<List<Countries>>? listCountries,
    Optional<Countries>? selectedCountries,
    Optional<List<Provinces>>? listProvinces,
    Optional<Provinces>? selectedProvince,
    Optional<List<District>>? listDistrict,
    Optional<District>? selectedDistrict,
    ShopModelUpdate? shopModelUpdate,
    UserModelUpdate? userModelUpdate
  }) {
    return UpdateShopState(
      isInvoiceExact: isInvoiceExact ?? this.isInvoiceExact,
      listCountries:  getValue(listCountries, this.listCountries),
      selectedCountries: getValue(selectedCountries, this.selectedCountries),
      listProvinces: getValue(listProvinces, this.listProvinces),
      selectedProvince: getValue(selectedProvince, this.selectedProvince),
      listDistrict: getValue(listDistrict, this.listDistrict),
      selectedDistrict: getValue(selectedDistrict, this.selectedDistrict),
      shopModelUpdate: shopModelUpdate ?? this.shopModelUpdate,
      userModelUpdate: userModelUpdate ?? this.userModelUpdate,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    isInvoiceExact,
    listCountries,
    selectedCountries,
    listProvinces,
    selectedProvince,
    listDistrict,
    selectedDistrict,
    shopModelUpdate,
    userModelUpdate
  ];

}

