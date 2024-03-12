import 'package:shared_module/features/my_cart/model/cart_response.dart';

class CheckOutItemModel {
  EntityDtos shop;
  List<ItemInShops> listItem;

  CheckOutItemModel({required this.shop, required this.listItem});
}

class ItemInShops {
  ObjectDtOs item;
  ItemInShops({required this.item});
}
