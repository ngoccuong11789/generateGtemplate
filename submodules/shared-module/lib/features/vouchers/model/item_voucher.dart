
import 'package:shared_module/features/vouchers/model/shipping_voucher_data.dart';
import 'package:shared_module/features/vouchers/model/shop_voucher_data.dart';

class ItemVoucherShop{
  final String shopId;
  late DataItemShopVoucher? voucherId;

  ItemVoucherShop({required this.shopId, this.voucherId});

}

class ItemVoucherShipping{
  final String shopId;
  late DataItemVoucher? voucherId;

  ItemVoucherShipping({required this.shopId, this.voucherId});
}
