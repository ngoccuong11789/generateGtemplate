import 'package:flutter/cupertino.dart';

import 'VoucherResponseModel.dart';

class FilterModelForVoucherManagement {
  final VoucherType? voucherType;
  final DateTime? startDay;
  final DateTime? endDay;
  final bool noExpiredDate;
  final bool displayVoucher;

  FilterModelForVoucherManagement(
      {required this.voucherType,
      required this.startDay,
      required this.endDay,
      this.noExpiredDate = false,
      this.displayVoucher = false});

  FilterModelForVoucherManagement copyWith({
    VoucherType? voucherType,
    DateTime? startDay,
    DateTime? endDay,
    bool? noExpiredDate,
    bool? displayVoucher,
  }) =>
      FilterModelForVoucherManagement(
        voucherType: voucherType ?? this.voucherType,
        startDay: startDay ?? this.startDay,
        endDay: endDay ?? this.endDay,
        noExpiredDate: noExpiredDate ?? this.noExpiredDate,
        displayVoucher: displayVoucher ?? this.displayVoucher,
      );
  bool validate(){
    if(voucherType?.id == null && startDay == null && endDay == null){
      return true;
    }
    return false;
  }
}
