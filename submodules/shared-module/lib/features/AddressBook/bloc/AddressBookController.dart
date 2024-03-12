import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookService.dart';
import 'package:shared_module/features/AddressBook/model/AddressNewModel.dart';
import 'package:shared_module/features/AddressBook/model/CreateAddress.dart';
import 'package:shared_module/features/AddressBook/model/DropdownItemModel.dart';

class AddressBookController extends BaseApiController {
  final AddressBookService addressBookService;

  AddressBookController(Dio dio) : addressBookService = AddressBookService(dio);

  Future<List<AddressNewModel>> fetchData() async {
    return handleResponse(await addressBookService.getListAddress());
  }

  Future<List<DropdownItemModel>> getCountry() async {
    return handleResponse(await addressBookService.getCountry());
  }

  Future<List<DropdownItemModel>> getProvince(String countryId) async {
    return handleResponse(await addressBookService.getProvince(countryId));
  }

  Future<List<DropdownItemModel>> getDistrict(String provinceId) async {
    return handleResponse(await addressBookService.getDistrict(provinceId));
  }

  Future<List<DropdownItemModel>> getWard(String provinceId) async {
    return handleResponse(await addressBookService.getWard(provinceId));
  }

  Future<AddressNewModel> createAddress(Map<String,dynamic> data) async {
    return handleResponse(await addressBookService.createAddress(data));
  }

  Future<dynamic> deleteAddress(String id) async {
    return handleResponse(await addressBookService.deleteAddress(id));
  }

  Future<AddressNewModel> updateAddress(
      Map<String,dynamic> data, String id) async {
    return handleResponse(await addressBookService.updateAddress(data, id));
  }

  String getItem(List<DropdownItemModel> data, String name) {
    return data.where((element) => element.name == name).first.id;
  }
}
