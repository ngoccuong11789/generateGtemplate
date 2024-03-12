import 'package:equatable/equatable.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/AddressBook/model/DropdownItemModel.dart';

class AddressBookState extends Equatable {
  final List<AddressNewModel> data;
  final List<DropdownItemModel> provinceList;
  final List<DropdownItemModel> districtList;
  final List<DropdownItemModel> wardList;
  final List<DropdownItemModel> countryList;
  final AddressNewModel? defaultAddress;
  final AddressNewModel? selectedAddress;
  final AddressNewModel? currentAddress;
  final bool fetchData;
  final int? count;
  const AddressBookState( {
    this.data = const [],
    this.defaultAddress,
    this.currentAddress,
    this.provinceList = const [],
    this.countryList = const [],
    this.districtList = const [],
    this.wardList = const [],
    this.selectedAddress,
    this.fetchData =false,
    this.count = 0,
  });

  @override
  List<Object?> get props => [
        data,
        provinceList,
        districtList,
        wardList,
        defaultAddress,
        countryList,
        selectedAddress,
        fetchData
      ];

  AddressBookState copyWith(
      {List<AddressNewModel>? addressList,
      List<DropdownItemModel>? provinceData,
      List<DropdownItemModel>? countryList,
      List<DropdownItemModel>? wardData,
      bool? showError,
      AddressNewModel? defaultAddress,
      AddressNewModel? selectedAddress,
      AddressNewModel? currentAddress, bool? fetchData,
        int? count,
      List<DropdownItemModel>? districtData}) {
    return AddressBookState(
      data: addressList ?? data,
      provinceList: provinceData ?? provinceList,
      districtList: districtData ?? districtList,
      countryList: countryList ?? this.countryList,
      wardList: wardData ?? wardList,
      defaultAddress: defaultAddress ?? this.defaultAddress,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      currentAddress: currentAddress ?? this.currentAddress,
      fetchData: fetchData ?? this.fetchData,
        count: count?? this.count
    );
  }
}
