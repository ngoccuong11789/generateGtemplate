import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/add_new_voucher/api/add_voucher_controller.dart';
import 'package:shared_module/features/add_new_voucher/bottom_sheets/select_platform_bottom_sheet.dart';
import 'package:shared_module/features/add_new_voucher/inform_customer_demographic.dart';
import 'package:shared_module/features/add_new_voucher/models/area_type.dart';
import 'package:shared_module/features/add_new_voucher/models/payment_type.dart';
import 'package:shared_module/features/add_new_voucher/models/voucher_type.dart';
import 'package:shared_module/features/add_new_voucher/widgets/applicable_product.dart';
import 'package:shared_module/features/add_new_voucher/widgets/discount_type.dart';
import 'package:shared_module/features/add_new_voucher/widgets/maximum_discount_price.dart';
import 'package:shared_module/features/product_categories/models/local_catalog.dart';
import 'package:shared_module/shared_module.dart';

part 'add_voucher_event.dart';
part 'add_voucher_state.dart';

class AddVoucherBloc extends Bloc<AddVoucherEvent, AddVoucherState> {
  var controller = AddVoucherController(SharedModule.appDelegates!.dio);

  AddVoucherBloc()
      : super(AddVoucherState(
          buytype: BUYTYPE.ecommerce,
          voucherTypeId: VoucherType(),
          elementIds: const [],
          voucherCode: '',
          name: '',
          description: '',
          voucherStatus: 'ACTIVE',
          discountType: "PRICE",
          discountAmount: 0,
          minimumOrderPrice: 0,
          maxDiscountPrice: 0,
          maxUsageCount: 0,
          maximumUsagePerUserCount: 0,
          usedCount: 0,
          startDate: DateTime.now().toUtc(),
          endDate: DateTime.now().toUtc(),
          platform: '',
          paymentTypeId: PaymentType(),
          displaySetting: "ALL_PAGE",
          isPublic: false,
          isLimitDiscountPrice: true,
          isLimitUsage: false,
          isApplicableAll: true,
          areas: const [],
          category: LocalCatalog()
        )) {
    on<SaveBuyTypeEvent>((event, emit) {
      emit(state.copyWith(buytype: event.buyType));
    });

    on<SelectVoucherType>(
      (event, emit) {
        emit(state.copyWith(voucherTypeId: event.type));
      },
    );

    on<SelectPaymentType>(
      (event, emit) {
        emit(state.copyWith(paymentTypeId: event.type));
      },
    );

    on<SelectPlatform>(
      (event, emit) {
        String name = "";
        if (event.type == PlatformEnum.web) {
          name = "WEB";
        } else if (event.type == PlatformEnum.app) {
          name = "APP";
        } else {
          name = "ALL";
        }
        emit(state.copyWith(platform: name));
      },
    );

    on<SetVoucherName>(
      (event, emit) {
        emit(state.copyWith(name: event.name));
      },
    );

    on<SetVoucherCode>(
      (event, emit) {
        emit(state.copyWith(voucherCode: event.name));
      },
    );

    on<SetStartDate>(
      (event, emit) {
        emit(state.copyWith(startDate: event.date.toUtc()));
      },
    );

    on<SetEndDate>(
      (event, emit) {
        emit(state.copyWith(endDate: event.date.toUtc()));
      },
    );

    on<ChangeDiscountType>(
      (event, emit) {
        if (event.type == DiscountTypeEnum.byPercentage) {
          emit(state.copyWith(discountType: "PERCENTAGE"));
        } else {
          emit(state.copyWith(discountType: "PRICE"));
        }
      },
    );

    on<TogglePublish>(
      (event, emit) {
        emit(state.copyWith(isPublic: event.toggle));
      },
    );

    on<SetDiscountAmount>(
      (event, emit) {
        double? a;
        try {
          a = double.tryParse(event.value);
        } catch (e) {
          a = null;
        }
        emit(state.copyWith(discountAmount: a));
      },
    );

    on<ChangeDiscountLimitType>(
      (event, emit) {
        if (event.type == MaxDiscountPrice.noLimit) {
          emit(state.copyWith(isLimitDiscountPrice: false));
        } else {
          emit(state.copyWith(isLimitDiscountPrice: true));
        }
      },
    );

    on<SetMaximumDiscount>(
      (event, emit) {
        int? a;
        try {
          a = int.tryParse(event.value);
        } catch (e) {
          a = null;
        }
        emit(state.copyWith(maxDiscountPrice: a));
      },
    );

    on<SetMinimumOrderPrice>(
      (event, emit) {
        int? a;
        try {
          a = int.tryParse(event.value);
        } catch (e) {
          a = null;
        }
        emit(state.copyWith(minimumOrderPrice: a));
      },
    );

    on<MaxDistributionPerBuyer>(
      (event, emit) {
        int? a;
        try {
          a = int.tryParse(event.value);
        } catch (e) {
          a = null;
        }
        emit(state.copyWith(maximumUsagePerUserCount: a));
      },
    );

     on<SetQuantity>(
      (event, emit) {
        int? a;
        try {
          a = int.tryParse(event.value);
        } catch (e) {
          a = null;
        }
        emit(state.copyWith(maxUsageCount: a));
      },
    );

    on<SetDescription>(
      (event, emit) {
        emit(state.copyWith(description: event.value));
      },
    );

    on<ChangeVoucherDisplayType>(
      (event, emit) {
        if (event.type == VoucherDisplay.allPages) {
          emit(state.copyWith(displaySetting: "ALL_PAGE"));
        } else if (event.type == VoucherDisplay.sharable) {
          emit(state.copyWith(displaySetting: "PRIVATE"));
        } else {
          emit(state.copyWith(displaySetting: "LIVESTREAM"));
        }
      },
    );

    on<ChangeApplicableType>(
      (event, emit) {
        if (event.type == Applicable.allProducts) {
          emit(state.copyWith(isApplicableAll: true));
        } else {
          emit(state.copyWith(isApplicableAll: false));
        }
      },
    );

    on<SeetApplicableProducts>(
      (event, emit) {
        emit(state.copyWith(elementIds: event.list));
      },
    );
    on<SelectArea>(
      (event, emit) {
        emit(state.copyWith(areas: event.list));
      },
    );
    on<SelectCategory>(
      (event, emit) {
        emit(state.copyWith(category: event.value));
      },
    );
    on<SetLimitUsage> ((event, emit) => emit(state.copyWith(isLimitUsage: event.value)));
  }

  void validatedAddVoucher({required Function onSuccess,
      required Function(AddVoucherError error) onError}) async {
    if (state.voucherTypeId.name == null || state.voucherCode.isEmpty || state.name.isEmpty){
      onError.call(AddVoucherError.missField);
    } else if (state.startDate.compareTo(state.endDate) != -1){ 
      onError.call(AddVoucherError.missValidPeriod);
    } else if ((state.discountAmount == 0 || state.minimumOrderPrice == 0 || state.maximumUsagePerUserCount == 0) || (state.discountType != "PRICE" && state.isLimitDiscountPrice && state.maxDiscountPrice == 0) || (!state.isLimitUsage && state.maxUsageCount == 0)) {
      onError.call(AddVoucherError.missVoucherSetting);      
    } else if (state.paymentTypeId.name == null || state.platform.isEmpty || state.description.isEmpty) {
      onError.call(AddVoucherError.missDetailInformation);
    } else if(!state.isApplicableAll &&(state.category.id == null && state.elementIds.isEmpty)) {      
      state.elementIds.isEmpty && state.category.id == null ? onError.call(AddVoucherError.missProduct):onError.call(AddVoucherError.missCategory);
    } else {
      onSuccess.call();
    }
  }
}
