import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookController.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/AddressBook/model/DropdownItemModel.dart';
import 'package:shared_module/shared_module.dart';

import 'AddressBookEvent.dart';
import 'AddressbookState.dart';

class AddressBookBloc extends Bloc<AddressBookEvent, AddressBookState> {
  AddressBookController controller =
      AddressBookController(SharedModule.appDelegates!.dio);
  AddressBookBloc()
      : super(AddressBookState(
          data: [],
          currentAddress: AddressNewModel(userFullName: ''),
        )) {
    on((GetAddressList event, emit) async {
      List<AddressNewModel> data = await controller.fetchData();
      emit(state.copyWith(
          addressList: data,
          fetchData: false,
          selectedAddress:
              data.where((element) => element.isDefault == true).firstOrNull ??
                  AddressNewModel()));
    });
    on((GetDataDistrict event, emit) async {
      List<DropdownItemModel> data = await controller.getDistrict(event.id);
      emit(state.copyWith(districtData: data, wardData: []));
    });
    on((GetDataWard event, emit) async {
      List<DropdownItemModel> data = await controller.getWard(event.id);
      emit(state.copyWith(wardData: data));
    });
    on((LoadDataForAddress event, emit) async {
      List<DropdownItemModel> countryList = await controller.getCountry();
      List<DropdownItemModel> provinceList = [];
      List<DropdownItemModel> districtList = [];
      List<DropdownItemModel> wardList = [];
      if (event.country != null) {
        String countryId = controller.getItem(countryList, event.country!);
        provinceList = await controller.getProvince(countryId);
        if (event.cityName != null) {
          String provinceId = controller.getItem(provinceList, event.cityName!);
          districtList = await controller.getDistrict(provinceId);
          if (event.districtName != null) {
            String districtId =
                controller.getItem(districtList, event.districtName!);
            wardList = await controller.getWard(districtId);
          }
        }
      }
      emit(state.copyWith(
          countryList: countryList,
          wardData: wardList,
          districtData: districtList,
          provinceData: provinceList,
          currentAddress: event.data));
    });
    on((DeleteAddress event, emit) async {
      await controller.deleteAddress(event.id);
      emit(state.copyWith(fetchData: true));
    });
    on((CreateAddress event, emit) async {
      AddressNewModel? address = AddressNewModel();
      var res = await controller.createAddress(event.createAddress.toJson());
      if (state.selectedAddress?.id != null) {
        address = state.selectedAddress;
      } else {
        address = res;
      }
      emit(state.copyWith(
          selectedAddress: address, fetchData: true));
    });
    on((UpdateAddress event, emit) async {
      await controller.updateAddress(event.createAddress.toJson(), event.id);
      emit(state.copyWith(fetchData: true));
    });
    on((GetDataProvince event, emit) async {
      List<DropdownItemModel> data = await controller.getProvince(event.id);
      emit(state.copyWith(provinceData: data, wardData: [], districtData: []));
    });
    on<SelectBuyingAddress>(
      (event, emit) {
        emit(state.copyWith(selectedAddress: event.selectedAddress));
      },
    );
  }
}
