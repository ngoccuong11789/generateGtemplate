import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/query_builder/query_builder.dart';

import '../controller/voucher_management_controller.dart';
import '../enum/TyppeVoucher.dart';
import '../model/FilterModelForVoucherManagement.dart';
import '../model/ItemQuantity.dart';
import '../model/TabEnum.dart';
import '../model/VoucherResponseModel.dart';

part 'voucher_management_event.dart';

part 'voucher_management_state.dart';

class VoucherManagementBloc
    extends Bloc<VoucherManagementEvent, VoucherManagementState> {
  VoucherManagementController controller =
      VoucherManagementController(SharedModule.appDelegates!.dio);

  VoucherManagementBloc()
      : super(VoucherManagementState(
            voucherResponseModel: VoucherResponseModel(),
            dataHeaderList: [],
            tab: TabEnum.ALL.name,
            voucherType: [],
            filterModelForVoucherManagement: FilterModelForVoucherManagement(
                endDay: null,
                startDay: null,
                voucherType: VoucherType(),
                displayVoucher: false,
                noExpiredDate: false),
            textEditingController: TextEditingController())) {
    on<Search>((Search event, emit) async {
      emit(state.copyWith(loadPage: true));
      VoucherResponseModel voucherResponseModel = await controller.search(
          handQuery(state.filterModelForVoucherManagement,
              state.textEditingController.text, state.filter),
          0,
          state.tab,
          event.typeVoucher);
      emit(state.copyWith(
        voucherResponseModel: voucherResponseModel,
        loadPage: false,
      ));
    });
    on<DeleteVoucher>((DeleteVoucher event, emit) async {
      emit(state.copyWith(loadPage: true));
      var res = await controller.deleteVoucher(event.id);
      List<ItemQuantity> data = await controller.getQuantity(event.typeVoucher);
      VoucherResponseModel voucherResponseModel =
          await controller.search("", 0, state.tab, event.typeVoucher);
      emit(state.copyWith(
        voucherResponseModel: voucherResponseModel,
        dataHeaderList: data,
        loadPage: false,
      ));
    });
    on<PublicVoucher>((PublicVoucher event, emit) async {
      emit(state.copyWith(loadPage: true));
      var res = await controller.publicVoucher(event.id);
      List<ItemQuantity> data = await controller.getQuantity(event.typeVoucher);
      VoucherResponseModel voucherResponseModel =
          await controller.search("", 0, state.tab, event.typeVoucher);
      emit(state.copyWith(
        voucherResponseModel: voucherResponseModel,
        dataHeaderList: data,
        loadPage: false,
      ));
    });
    on<LoadMore>((LoadMore event, emit) async {
      if ((state.voucherResponseModel.totalElement! /
              state.voucherResponseModel.pageSize!) >
          state.voucherResponseModel.page!) {
        emit(state.copyWith(loading: true));
        num page = state.voucherResponseModel.page! + 1;
        VoucherResponseModel voucherResponseModel = await controller.search(
            handQuery(state.filterModelForVoucherManagement,
                state.textEditingController.text, state.filter),
            page.toInt(),
            state.tab,
            event.typeVoucher);
        VoucherResponseModel mergeData = voucherResponseModel.copyWith(data: [
          ...?state.voucherResponseModel.data,
          ...?voucherResponseModel.data
        ]);
        emit(state.copyWith(
          voucherResponseModel: mergeData,
          loading: false,
        ));
      }
    });
    on<Filter>((Filter event, emit) async {
      emit(state.copyWith(loadPage: true));
      FilterModelForVoucherManagement filter = FilterModelForVoucherManagement(voucherType: event.filterModelForVoucherManagement.voucherType, startDay: event.filterModelForVoucherManagement.startDay?.toUtc(), endDay: event.filterModelForVoucherManagement.endDay?.toUtc(), noExpiredDate: event.filterModelForVoucherManagement.noExpiredDate,
                  displayVoucher: event.filterModelForVoucherManagement.displayVoucher);
      VoucherResponseModel voucherResponseModel = await controller.search(
          handQuery(filter,
              state.textEditingController.text, true),
          0,
          state.tab,
          event.typeVoucher);
      emit(state.copyWith(
          filterModelForVoucherManagement: filter,
          voucherResponseModel: voucherResponseModel,
          loadPage: false,
          filter: true));
    });
    on<ChangePage>((ChangePage event, emit) async {
      emit(state.copyWith(loadPage: true));
      if (state.dataHeaderList.isEmpty) {
        List<ItemQuantity> data =
            await controller.getQuantity(event.typeVoucher);
        emit(state.copyWith(dataHeaderList: data));
      }
      if (state.voucherType.isEmpty) {
        List<VoucherType> data =
            await controller.getVoucherType(event.typeVoucher);
        emit(state.copyWith(voucherType: data));
      }
      VoucherResponseModel voucherResponseModel = await controller.search(
          handQuery(state.filterModelForVoucherManagement,
              state.textEditingController.text, state.filter),
          0,
          event.tabEnum,
          event.typeVoucher);
      emit(state.copyWith(
          voucherResponseModel: voucherResponseModel,
          loadPage: false,
          tab: event.tabEnum));
    });
    on<DisableFilter>((DisableFilter event, emit) async {
      emit(state.copyWith(loadPage: true));
      VoucherResponseModel voucherResponseModel = await controller.search(
          handQuery(state.filterModelForVoucherManagement,
              state.textEditingController.text, false),
          0,
          state.tab,
          event.typeVoucher);
      emit(state.copyWith(
        filter: false,
        filterModelForVoucherManagement: FilterModelForVoucherManagement(
            voucherType: VoucherType(), startDay: null, endDay: null),
        voucherResponseModel: voucherResponseModel,
        loadPage: false,
      ));
    });
  }

  handQuery(FilterModelForVoucherManagement filterModelForVoucherManagement,
      String? searchTerm, bool filter) {
    QueryBuilder query = QueryBuilder();
    if (filter) {
      if (filterModelForVoucherManagement.endDay != null) {
        query
            .field("end_date")
            .lessThan((((filterModelForVoucherManagement.noExpiredDate
                            ? (DateTime.utc(2050, 1, 1).millisecondsSinceEpoch)
                            : filterModelForVoucherManagement
                                .endDay!.millisecondsSinceEpoch) +
                        25200000) *
                    1000)
                .toString())
            .then();
      }
      if (filterModelForVoucherManagement.startDay != null) {
        query
            .field("start_date")
            .greaterThan((((filterModelForVoucherManagement.noExpiredDate
                            ? (DateTime.utc(1970, 1, 1).millisecondsSinceEpoch)
                            : filterModelForVoucherManagement
                                .startDay!.millisecondsSinceEpoch) +
                        25200000) *
                    1000)
                .toString())
            .then();
      }
      if (filterModelForVoucherManagement.voucherType?.id != null) {
        query
            .field("voucher_type_id")
            .equal(filterModelForVoucherManagement.voucherType!.id!)
            .then();
      }
    }

    print(searchTerm!.isNotEmpty
        ? query.field("name").contain(searchTerm).then().build()
        : "");
    return searchTerm.isNotEmpty
        ? query.field("name").contain(searchTerm).then().build()
        : query.build();
  }
}
