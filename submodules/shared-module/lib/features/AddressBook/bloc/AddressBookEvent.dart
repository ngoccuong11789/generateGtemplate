import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';

class AddressBookEvent {}

class GetDataDistrict extends AddressBookEvent {
  final String id;

  GetDataDistrict(this.id);
}

class GetDataProvince extends AddressBookEvent {
  final String id;

  GetDataProvince(this.id);
}

class GetDataWard extends AddressBookEvent {
  final String id;

  GetDataWard(this.id);
}

class GetAddressList extends AddressBookEvent {}

class DeleteAddress extends AddressBookEvent {
  final String id;

  DeleteAddress(this.id);
}

class LoadDataForAddress extends AddressBookEvent {
  final String? districtName;
  final String? wardName;
  final String? cityName;
  final String? country;
  final AddressNewModel data;

  LoadDataForAddress(
      {this.wardName,
      this.districtName,
      this.cityName,
      this.country,
      required this.data});
}

class GetIdForDropdownItem extends AddressBookEvent {
  final String id;

  GetIdForDropdownItem(this.id);
}

class CreateAddress extends AddressBookEvent {
  final AddressNewModel createAddress;

  CreateAddress(this.createAddress);
}

class UpdateAddress extends AddressBookEvent {
  final AddressNewModel createAddress;
  final String id;
  UpdateAddress(this.createAddress, this.id);
}

class SelectBuyingAddress extends AddressBookEvent {
  final AddressNewModel selectedAddress;

  SelectBuyingAddress(this.selectedAddress);
}
