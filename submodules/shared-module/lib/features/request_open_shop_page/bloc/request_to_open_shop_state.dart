part of 'request_to_open_shop_bloc.dart';

class Optional<T> {
  final T? value;
  Optional.of(this.value);
  Optional.empty(): value = null;
}

class RequestToOpenShopState extends Equatable {
  final bool offlineStore;
  final Provinces? provinces;
  final District? district;
  final Ward? ward;
  final TimeOfDay openingTime;
  final TimeOfDay closedTime;
  final Category category;
  final Category productCategory;
  final WorkingDays workingDays;
  final Attachments attachments;
  final AdvancedModel advancedModel;
  final ShopModel shopModel;
  final UserModel userModel;
  final DataCountries? selectedCountries;
  final DataProvinces? selectedProvinces;
  final DataDistrict? selectedDistrict;
  final DataWard? selectedWard;
  final DataFile? logoShop;
  final List<DataAttachments>? dataAttachments;
  final Countries? listCountries;

  T? getValue<T>(Optional<T>? optional, T? defaultValue) {
    if (optional == null) {
      return defaultValue;
    } else {
      return optional.value;
    }
  }

  const RequestToOpenShopState({
    this.offlineStore = false,
    this.provinces,
    this.district,
    this.ward,
    this.openingTime = const TimeOfDay(hour: 0, minute: 0),
    this.closedTime = const TimeOfDay(hour: 0, minute: 0),
    this.category = const Category(),
    this.productCategory = const Category(),
    this.workingDays = const WorkingDays(),
    this.attachments = const Attachments(
      logo: Attachment(),
      prop1: Attachment(),
      prop2: Attachment(),
      prop3: Attachment(),
    ),
    this.dataAttachments,
    this.advancedModel = const AdvancedModel(),
    this.shopModel = const ShopModel(),
    this.userModel = const UserModel(),
    this.selectedCountries,
    this.selectedProvinces,
    this.selectedDistrict,
    this.selectedWard,
    this.logoShop,
    this.listCountries,
  });

  RequestToOpenShopState copyWith({
    bool? offlineStore,
    Optional<Provinces>? provinces,
    Optional<District>? district,
    Optional<Ward>? ward,
    TimeOfDay? openingTime,
    TimeOfDay? closedTime,
    Category? category,
    Category? productCategory,
    WorkingDays? workingDays,
    int? numOfAttachments,
    Attachments? attachments,
    AdvancedModel? advancedModel,
    ShopModel? shopModel,
    UserModel? userModel,
    Optional<DataCountries>? selectedCountries,
    Optional<DataProvinces>? selectedProvinces,
    Optional<DataDistrict>? selectedDistrict,
    Optional<DataWard>? selectedWard,
    Optional<DataFile>? logoShop,
    Optional<List<DataAttachments>>? dataAttachments,
    Optional<Countries>? listCountries,
  }) {
    return RequestToOpenShopState(
      offlineStore: offlineStore?? this.offlineStore,
      provinces: getValue(provinces, this.provinces),
      district: getValue(district, this.district),
      ward: getValue(ward, this.ward),
      openingTime: openingTime ?? this.openingTime,
      closedTime: closedTime ?? this.closedTime,
      category: category ?? this.category,
      productCategory: productCategory ?? this.productCategory,
      workingDays: workingDays ?? this.workingDays,
      attachments: attachments ?? this.attachments,
      advancedModel: advancedModel ?? this.advancedModel,
      shopModel: shopModel ?? this.shopModel,
      userModel: userModel ?? this.userModel,
      selectedCountries: getValue(selectedCountries, this.selectedCountries),
      selectedProvinces: getValue(selectedProvinces, this.selectedProvinces),
      selectedDistrict: getValue(selectedDistrict, this.selectedDistrict),
      selectedWard: getValue(selectedWard, this.selectedWard),
      logoShop: getValue(logoShop, this.logoShop),
      dataAttachments: getValue(dataAttachments, this.dataAttachments),
      listCountries: getValue(listCountries, this.listCountries)
    );
  }

  @override
  List<Object?> get props => [
        offlineStore,
        provinces,
        district,
        ward,
        openingTime,
        closedTime,
        category,
        productCategory,
        workingDays,
        attachments.logo,
        attachments.prop1,
        attachments.prop2,
        attachments.prop3,
        attachments.numOfAttachments,
        dataAttachments,
        advancedModel,
        shopModel,
        userModel,
        selectedCountries,
        selectedProvinces,
        selectedDistrict,
        selectedWard,
        logoShop,
        listCountries,
      ];

}
