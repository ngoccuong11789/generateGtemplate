part of 'voucher_management_bloc.dart';

class VoucherManagementState extends Equatable {
  final VoucherResponseModel voucherResponseModel;
  final bool loading;
  final bool loadPage;
  final bool filter;
  final List<ItemQuantity> dataHeaderList;
  final String tab;
  final List<VoucherType> voucherType;
  final FilterModelForVoucherManagement filterModelForVoucherManagement;
  final TextEditingController textEditingController;

  const VoucherManagementState({
    required this.voucherResponseModel,
    this.loading = false,
    this.loadPage = false,
    this.filter = false,
    this.tab = "",
    required this.filterModelForVoucherManagement,
    required this.dataHeaderList,
    required this.voucherType,
    required this.textEditingController,
  });

  @override
  List<Object> get props =>
      [voucherResponseModel, loading, loadPage, dataHeaderList, voucherType];

  VoucherManagementState copyWith(
      {VoucherResponseModel? voucherResponseModel,
      bool? loading,
      bool? filter,
      String? search,
      String? tab,
      FilterModelForVoucherManagement? filterModelForVoucherManagement,
      List<VoucherType>? voucherType,
      List<ItemQuantity>? dataHeaderList,
      bool? loadPage}) {
    return VoucherManagementState(
        loading: loading ?? this.loading,
        filter: filter ?? this.filter,
        loadPage: loadPage ?? this.loadPage,
        tab: tab ?? this.tab,
        voucherResponseModel: voucherResponseModel ?? this.voucherResponseModel,
        dataHeaderList: dataHeaderList ?? this.dataHeaderList,
        voucherType: voucherType ?? this.voucherType,
        filterModelForVoucherManagement: filterModelForVoucherManagement ??
            this.filterModelForVoucherManagement,
        textEditingController: TextEditingController(
            text: search ?? textEditingController.text));
  }
}
