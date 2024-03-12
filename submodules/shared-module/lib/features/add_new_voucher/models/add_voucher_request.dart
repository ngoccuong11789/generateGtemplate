
class AddVoucherRequest {
  String? voucherTypeId;
  String? objectId;
  List<String>? elementIds;
  String? voucherCode;
  String? name;
  String? description;
  String? voucherStatus;
  String? discountType;
  double? discountAmount;
  int? minimumOrderPrice;
  int? maxDiscountPrice;
  int? maxUsageCount;
  int? maximumUsagePerUserCount;
  int? usedCount;
  String? startDate;
  String? endDate;
  String? platform;
  String? paymentTypeId;
  String? displaySetting;
  bool? isPublic;
  bool? isLimitDiscountPrice;
  bool? isLimitUsage;
  bool? isApplicableAll;
  String? categoryId;
  List<String>? areaIds;

  AddVoucherRequest({this.voucherTypeId, this.objectId, this.elementIds, this.voucherCode, this.name, this.description, this.voucherStatus, this.discountType, this.discountAmount, this.minimumOrderPrice, this.maxDiscountPrice, this.maxUsageCount, this.maximumUsagePerUserCount, this.usedCount, this.startDate, this.endDate, this.platform, this.paymentTypeId, this.displaySetting, this.isPublic, this.isLimitDiscountPrice, this.isLimitUsage, this.isApplicableAll, this.categoryId, this.areaIds});

  AddVoucherRequest.fromJson(Map<String, dynamic> json) {
    if(json["voucher_type_id"] is String) {
      voucherTypeId = json["voucher_type_id"];
    }
    if(json["object_id"] is String) {
      objectId = json["object_id"];
    }
    if(json["element_ids"] is List) {
      elementIds = json["element_ids"] == null ? null : List<String>.from(json["element_ids"]);
    }
    if(json["voucher_code"] is String) {
      voucherCode = json["voucher_code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["voucher_status"] is String) {
      voucherStatus = json["voucher_status"];
    }
    if(json["discount_type"] is String) {
      discountType = json["discount_type"];
    }
    if(json["discount_amount"] is double) {
      discountAmount = json["discount_amount"];
    }
    if(json["minimum_order_price"] is int) {
      minimumOrderPrice = json["minimum_order_price"];
    }
    if(json["max_discount_price"] is int) {
      maxDiscountPrice = json["max_discount_price"];
    }
    if(json["max_usage_count"] is int) {
      maxUsageCount = json["max_usage_count"];
    }
    if(json["maximum_usage_per_user_count"] is int) {
      maximumUsagePerUserCount = json["maximum_usage_per_user_count"];
    }
    if(json["used_count"] is int) {
      usedCount = json["used_count"];
    }
    if(json["start_date"] is String) {
      startDate = json["start_date"];
    }
    if(json["end_date"] is String) {
      endDate = json["end_date"];
    }
    if(json["platform"] is String) {
      platform = json["platform"];
    }
    if(json["payment_type_id"] is String) {
      paymentTypeId = json["payment_type_id"];
    }
    if(json["display_setting"] is String) {
      displaySetting = json["display_setting"];
    }
    if(json["is_public"] is bool) {
      isPublic = json["is_public"];
    }
    if(json["is_limit_discount_price"] is bool) {
      isLimitDiscountPrice = json["is_limit_discount_price"];
    }
    if(json["is_limit_usage"] is bool) {
      isLimitUsage = json["is_limit_usage"];
    }
    if(json["is_applicable_all"] is bool) {
      isApplicableAll = json["is_applicable_all"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["voucher_type_id"] = voucherTypeId;
    _data["object_id"] = objectId;
    if(elementIds != null) {
      _data["element_ids"] = elementIds;
    }
    _data["voucher_code"] = voucherCode;
    _data["name"] = name;
    _data["description"] = description;
    _data["voucher_status"] = voucherStatus;
    _data["discount_type"] = discountType;
    _data["discount_amount"] = discountAmount;
    _data["minimum_order_price"] = minimumOrderPrice;
    _data["max_discount_price"] = maxDiscountPrice;
    _data["max_usage_count"] = maxUsageCount;
    _data["maximum_usage_per_user_count"] = maximumUsagePerUserCount;
    _data["used_count"] = usedCount;
    _data["start_date"] = startDate;
    _data["end_date"] = endDate;
    _data["platform"] = platform;
    _data["payment_type_id"] = paymentTypeId;
    _data["display_setting"] = displaySetting;
    _data["is_public"] = isPublic;
    _data["is_limit_discount_price"] = isLimitDiscountPrice;
    _data["is_limit_usage"] = isLimitUsage;
    _data["is_applicable_all"] = isApplicableAll;
    _data["category_id"] = categoryId;
    _data["area_ids"] = areaIds;
    return _data;
  }
  @override
  String toString() {
    return toJson().toString();
  }
}