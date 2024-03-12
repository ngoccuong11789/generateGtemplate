part of 'request_to_open_shop_bloc.dart';

sealed class RequestToOpenShopEvent extends Equatable {
  const RequestToOpenShopEvent();
}

class ChangeOfflineStoreOption extends RequestToOpenShopEvent {
  const ChangeOfflineStoreOption();
  @override
  List<Object?> get props => [];
}

class ChangeCityDistrictWard extends RequestToOpenShopEvent {
  const ChangeCityDistrictWard({required this.index, required this.inputPlace});
  final int index;
  final InputPlace inputPlace;
  @override
  List<Object?> get props => [
        index,
        inputPlace,
      ];
}

class GetLists extends RequestToOpenShopEvent {
  const GetLists();
  @override
  List<Object?> get props => [];
}

class ChangeTimes extends RequestToOpenShopEvent {
  const ChangeTimes({required this.opening, required this.newTime});
  final bool opening;
  final TimeOfDay? newTime;
  @override
  List<Object?> get props => [];
}

class ChangeCategory extends RequestToOpenShopEvent {
  const ChangeCategory({required this.index});
  final int index;
  @override
  List<Object?> get props => [];
}

class DeleteCategory extends RequestToOpenShopEvent {
  const DeleteCategory({required this.index});
  final int index;
  @override
  List<Object?> get props => [];
}

class ChangWorkingDays extends RequestToOpenShopEvent {
  const ChangWorkingDays({required this.index});
  final int index;
  @override
  List<Object?> get props => [];
}

class ChangeProductCategory extends RequestToOpenShopEvent {
  const ChangeProductCategory({required this.index});
  final int index;
  @override
  List<Object?> get props => [];
}

class DeleteProductCategory extends RequestToOpenShopEvent {
  const DeleteProductCategory({required this.index});
  final int index;
  @override
  List<Object?> get props => [];
}

class AddAttachment extends RequestToOpenShopEvent {
  const AddAttachment();
  @override
  List<Object?> get props => [];
}

class DeleteAttachment extends RequestToOpenShopEvent {
  const DeleteAttachment({required this.index});
  final int index;
  @override
  List<Object?> get props => [];
}

class UploadImage extends RequestToOpenShopEvent {
  const UploadImage({required this.index, required this.description});
  final int index;
  final String description;
  @override
  List<Object?> get props => [];
}

class SendRequest extends RequestToOpenShopEvent {
  const SendRequest(
      this.name,
      this.ownerName,
      this.phone,
      this.country,
      this.province,
      this.district,
      this.ward,
      this.street,
      this.subStreet,
      this.email,
      this.idCard,
      this.openTime,
      this.closedTime,
      this.workingDays,
      this.address,
      this.googleMapUrl,
      this.longitude,
      this.latitude,
      this.avatar,
      this.attachments);
  final String? name;
  final String? ownerName;
  final String? phone;
  final DataCountries? country;
  final DataProvinces? province;
  final DataDistrict? district;
  final DataWard? ward;
  final String? street;
  final String? subStreet;
  final String? email;
  final String? idCard;
  final TimeOfDay? openTime;
  final TimeOfDay? closedTime;
  final List<String>? workingDays;
  final String? address;
  final String? googleMapUrl;
  final double? longitude;
  final double? latitude;
  final DataFile? avatar;
  final List<DataAttachments>? attachments;
  @override
  List<Object?> get props => [];
}

class GetListProvinceByCountryId extends RequestToOpenShopEvent {
  final String countryId;
  const GetListProvinceByCountryId({required this.countryId});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedProvince extends RequestToOpenShopEvent{
  final DataProvinces city;

  HandleSelectedProvince({required this.city});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HandleSelectedDistrict extends RequestToOpenShopEvent{
  final DataDistrict district;
  HandleSelectedDistrict({required this.district});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedWard extends RequestToOpenShopEvent{
  final DataWard ward;
  HandleSelectedWard({required this.ward});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UploadLogoShop extends RequestToOpenShopEvent {
  final File file;
  UploadLogoShop(this.file);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UploadAttachments extends RequestToOpenShopEvent{
  final int index;
  final List<File> files;
  UploadAttachments(this.files,this.index);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeInputFieldAttachment extends RequestToOpenShopEvent{
  final AdvancedModel advancedModel;
  ChangeInputFieldAttachment(this.advancedModel);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ChangeInputFieldUser extends RequestToOpenShopEvent{
  final UserModel userModel;
  ChangeInputFieldUser(this.userModel);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ChangeInputFieldShop extends RequestToOpenShopEvent{
  final ShopModel shopModel;
  ChangeInputFieldShop(this.shopModel);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetListCountries extends RequestToOpenShopEvent{
  const GetListCountries();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HandleSelectedCountries extends RequestToOpenShopEvent{
  final DataCountries dataCountries;
  const HandleSelectedCountries({required this.dataCountries});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleGetUserInformation extends RequestToOpenShopEvent{
  const HandleGetUserInformation();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

