part of 'update_shop_bloc.dart';

sealed class UpdateShopEvent extends Equatable {
  const UpdateShopEvent();
}

class HandleGetListCountries extends UpdateShopEvent{
  const HandleGetListCountries();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedCountries extends UpdateShopEvent{
  final Countries countries;

  const HandleSelectedCountries({required this.countries});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedProvinces extends UpdateShopEvent{
  final Provinces provinces;

  const HandleSelectedProvinces({required this.provinces});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSelectedDistrict extends UpdateShopEvent{
  final District district;

  const HandleSelectedDistrict({required this.district});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HandleGetShopInformation extends UpdateShopEvent{
  const HandleGetShopInformation();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleChangeExportElectronicInvoicesOption extends UpdateShopEvent{
  const HandleChangeExportElectronicInvoicesOption();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HandleSendRequestUpdateShop extends UpdateShopEvent{
  final String? name;
  final String? ownerName;
  final String? phone;
  final Countries? country;
  final Provinces? province;
  final District? district;
  final String? subStreet;
  final String? email;
  final String? address;
  final bool? isInvoiceExact;


  const HandleSendRequestUpdateShop(
      this.name,
      this.ownerName,
      this.phone,
      this.country,
      this.province,
      this.district,
      this.subStreet,
      this.email,
      this.address,
      this.isInvoiceExact);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeInputFieldShop extends UpdateShopEvent{

  final ShopModelUpdate shopModelUpdate;
  const ChangeInputFieldShop(this.shopModelUpdate);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


