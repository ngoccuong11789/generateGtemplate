import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/VoucherManagement/controller/voucher_management_service.dart';

import '../enum/TyppeVoucher.dart';
import '../model/ItemQuantity.dart';
import '../model/VoucherResponseModel.dart';

class VoucherManagementController extends BaseApiController {
  final VoucherManagementService service;

  VoucherManagementController(Dio dio)
      : service = VoucherManagementService(dio);

  @override
  Future<VoucherResponseModel> search(
      String query, int pageNum, String tabEnum,TypeVoucher typeVoucher) async {
    return handleResponse(await service.getData(query, pageNum, tabEnum,typeVoucher.name));
  }

  @override
  Future<List<ItemQuantity>> getQuantity(TypeVoucher query) async {
    return handleResponse(await service.getQuantity(query.name));
  }

  @override
  Future<List<VoucherType>> getVoucherType(TypeVoucher query) async {
    return handleResponse(await service.getVoucherType(query.name));
  }

  @override
  Future<dynamic> deleteVoucher(String id) async {
    return handleResponse(await service.deleteVoucher(id));
  }

  @override
  Future<dynamic> publicVoucher(String id) async {
    return handleResponse(await service.publicVoucher(id));
  }
}
