part of 'add_voucher_bloc.dart';

sealed class AddVoucherEvent extends Equatable {
  const AddVoucherEvent();

  @override
  List<Object> get props => [];
}

class SaveBuyTypeEvent extends AddVoucherEvent {
  final BUYTYPE buyType;

  const SaveBuyTypeEvent(this.buyType);
}

class SelectVoucherType extends AddVoucherEvent {
  final VoucherType type;

  const SelectVoucherType(this.type);
}

class SelectPaymentType extends AddVoucherEvent {
  final PaymentType type;

  const SelectPaymentType(this.type);
}

class SelectPlatform extends AddVoucherEvent {
  final PlatformEnum type;

  const SelectPlatform(this.type);
}

class SetVoucherName extends AddVoucherEvent {
  final String name;

  const SetVoucherName(this.name);
}

class SetVoucherCode extends AddVoucherEvent {
  final String name;

  const SetVoucherCode(this.name);
}

class SetStartDate extends AddVoucherEvent {
  final DateTime date;

  const SetStartDate(this.date);
}

class SetEndDate extends AddVoucherEvent {
  final DateTime date;

  const SetEndDate(this.date);
}

class ChangeDiscountType extends AddVoucherEvent {
  final DiscountTypeEnum type;

  const ChangeDiscountType(this.type);
}

class SetDiscountAmount extends AddVoucherEvent {
  final String value;

  const SetDiscountAmount(this.value);
}

class ChangeDiscountLimitType extends AddVoucherEvent {
  final MaxDiscountPrice type;

  const ChangeDiscountLimitType(this.type);
}

class SetMaximumDiscount extends AddVoucherEvent {
  final String value;

  const SetMaximumDiscount(this.value);
}

class SetMinimumOrderPrice extends AddVoucherEvent {
  final String value;

  const SetMinimumOrderPrice(this.value);
}

class MaxDistributionPerBuyer extends AddVoucherEvent {
  final String value;

  const MaxDistributionPerBuyer(this.value);
}

class SetQuantity extends AddVoucherEvent {
  final String value;

  const SetQuantity(this.value);
}


class SetDescription extends AddVoucherEvent {
  final String value;

  const SetDescription(this.value);
}

class ChangeVoucherDisplayType extends AddVoucherEvent {
  final VoucherDisplay type;

  const ChangeVoucherDisplayType(this.type);
}

class ChangeApplicableType extends AddVoucherEvent {
  final Applicable type;

  const ChangeApplicableType(this.type);
}

class SeetApplicableProducts extends AddVoucherEvent {
  final List<String>? list;

  const SeetApplicableProducts(this.list);
}

class TogglePublish extends AddVoucherEvent {
  final bool toggle;

  const TogglePublish(this.toggle);
}

class SelectCategory extends AddVoucherEvent {
  final LocalCatalog? value;

  const SelectCategory(this.value);
}

class SelectArea extends AddVoucherEvent {
  final List<AreaType>? list;

  const SelectArea(this.list);
}

class SetLimitUsage extends AddVoucherEvent {
  final bool value;

  const SetLimitUsage(this.value);
}
