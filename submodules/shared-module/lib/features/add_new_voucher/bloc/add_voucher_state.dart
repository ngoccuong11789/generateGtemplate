part of 'add_voucher_bloc.dart';

enum AddVoucherError {
  missField,
  missValidPeriod,
  missProduct,
  missCategory,
  missVoucherSetting,
  missDetailInformation
}

class AddVoucherState extends Equatable {
  final BUYTYPE buytype;
  final VoucherType voucherTypeId;
  final List<String> elementIds;
  final String voucherCode;
  final String name;
  final String description;
  final String voucherStatus;
  final String discountType;
  final double discountAmount;
  final int minimumOrderPrice;
  final int maxDiscountPrice;
  final int maxUsageCount;
  final int maximumUsagePerUserCount;
  final int usedCount;
  final DateTime startDate;
  final DateTime endDate;
  final String platform;
  final PaymentType paymentTypeId;
  final String displaySetting;
  final bool isPublic;
  final bool isLimitDiscountPrice;
  final bool isLimitUsage;
  final bool isApplicableAll;
  final LocalCatalog category;
  final List<AreaType> areas;

  const AddVoucherState({
    required this.buytype,
    required this.voucherTypeId,
    required this.elementIds,
    required this.voucherCode,
    required this.name,
    required this.description,
    required this.voucherStatus,
    required this.discountType,
    required this.discountAmount,
    required this.minimumOrderPrice,
    required this.maxDiscountPrice,
    required this.maxUsageCount,
    required this.maximumUsagePerUserCount,
    required this.usedCount,
    required this.startDate,
    required this.endDate,
    required this.platform,
    required this.paymentTypeId,
    required this.displaySetting,
    required this.isPublic,
    required this.isLimitDiscountPrice,
    required this.isLimitUsage,
    required this.isApplicableAll,
    required this.areas,
    required this.category,
  });

  @override
  List<Object> get props => [
        buytype,
        voucherTypeId,
        elementIds,
        voucherCode,
        name,
        description,
        voucherStatus,
        discountType,
        discountAmount,
        minimumOrderPrice,
        maxDiscountPrice,
        maxUsageCount,
        maximumUsagePerUserCount,
        usedCount,
        startDate,
        endDate,
        platform,
        paymentTypeId,
        displaySetting,
        isPublic,
        isLimitDiscountPrice,
        isLimitUsage,
        isApplicableAll,
        areas,
        category,
      ];

  AddVoucherState copyWith({
    BUYTYPE? buytype,
    VoucherType? voucherTypeId,
    List<String>? elementIds,
    String? voucherCode,
    String? name,
    String? description,
    String? voucherStatus,
    String? discountType,
    double? discountAmount,
    int? minimumOrderPrice,
    int? maxDiscountPrice,
    int? maxUsageCount,
    int? maximumUsagePerUserCount,
    int? usedCount,
    DateTime? startDate,
    DateTime? endDate,
    String? platform,
    PaymentType? paymentTypeId,
    String? displaySetting,
    bool? isPublic,
    bool? isLimitDiscountPrice,
    bool? isLimitUsage,
    bool? isApplicableAll,
    LocalCatalog? category,
    List<AreaType>? areas,
  }) {
    return AddVoucherState(
      buytype: buytype ?? this.buytype,
      voucherTypeId: voucherTypeId ?? this.voucherTypeId,
      elementIds: elementIds ?? this.elementIds,
      voucherCode: voucherCode ?? this.voucherCode,
      name: name ?? this.name,
      description: description ?? this.description,
      voucherStatus: voucherStatus ?? this.voucherStatus,
      discountType: discountType ?? this.discountType,
      discountAmount: discountAmount ?? this.discountAmount,
      minimumOrderPrice: minimumOrderPrice ?? this.minimumOrderPrice,
      maxDiscountPrice: maxDiscountPrice ?? this.maxDiscountPrice,
      maxUsageCount: maxUsageCount ?? this.maxUsageCount,
      maximumUsagePerUserCount:
          maximumUsagePerUserCount ?? this.maximumUsagePerUserCount,
      usedCount: usedCount ?? this.usedCount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      platform: platform ?? this.platform,
      paymentTypeId: paymentTypeId ?? this.paymentTypeId,
      displaySetting: displaySetting ?? this.displaySetting,
      isPublic: isPublic ?? this.isPublic,
      isLimitDiscountPrice: isLimitDiscountPrice ?? this.isLimitDiscountPrice,
      isLimitUsage: isLimitUsage ?? this.isLimitUsage,
      isApplicableAll: isApplicableAll ?? this.isApplicableAll,
      category: category ?? this.category,
      areas: areas ?? this.areas,);
  }
}