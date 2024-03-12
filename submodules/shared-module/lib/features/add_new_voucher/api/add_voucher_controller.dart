import 'package:dio/dio.dart';
import 'package:shared_module/base_api_controller.dart';
import 'package:shared_module/features/add_new_voucher/api/add_voucher_service.dart';
import 'package:shared_module/features/add_new_voucher/models/add_voucher_request.dart';
import 'package:shared_module/features/add_new_voucher/models/area_type.dart';
import 'package:shared_module/features/add_new_voucher/models/payment_type.dart';
import 'package:shared_module/features/add_new_voucher/models/voucher_type.dart';

class AddVoucherController extends BaseApiController {
  final AddVoucherService service;

  AddVoucherController(Dio dio) : service = AddVoucherService(dio);

  Future<List<VoucherType>> getVoucherType(String buytype) async {
    return handleResponse(await service.getVoucherType(buytype));
  }

  Future<List<PaymentType>> getPayment() async {
    return handleResponse(await service.getPayment());
  }

  Future addVoucher(AddVoucherRequest request) async {
    return handleResponse(await service.addVoucher(request));
  }

  Future addRestaurantVoucher(AddVoucherRequest request) async {
    return handleResponse(await service.addRestaurantVoucher(request));
  }

  Future<List<AreaType>> getArea() async {
    return handleResponse(await service.getArea());
  }

}
