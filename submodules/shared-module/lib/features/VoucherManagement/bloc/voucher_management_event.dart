part of 'voucher_management_bloc.dart';

class VoucherManagementEvent {}

class Search extends VoucherManagementEvent {
  final TypeVoucher typeVoucher;

  Search({required this.typeVoucher});
}

class DeleteVoucher extends VoucherManagementEvent {
  final String id;
  final TypeVoucher typeVoucher;

  DeleteVoucher(
    this.typeVoucher, {
    required this.id,
  });
}

class PublicVoucher extends VoucherManagementEvent {
  final String id;
  final TypeVoucher typeVoucher;

  PublicVoucher(
    this.typeVoucher, {
    required this.id,
  });
}

class LoadMore extends VoucherManagementEvent {
  final TypeVoucher typeVoucher;

  LoadMore(this.typeVoucher);
}

class Filter extends VoucherManagementEvent {
  final FilterModelForVoucherManagement filterModelForVoucherManagement;
  final TypeVoucher typeVoucher;

  Filter(this.filterModelForVoucherManagement, this.typeVoucher);
}

class DisableFilter extends VoucherManagementEvent {
  final TypeVoucher typeVoucher;

  DisableFilter({required this.typeVoucher});

}

class ChangePage extends VoucherManagementEvent {
  final String tabEnum;
  final TypeVoucher typeVoucher;

  ChangePage({
    required this.typeVoucher,
    required this.tabEnum,
  });
}
