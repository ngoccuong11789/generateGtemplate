part of 'variants_bloc.dart';

class VariantsState extends Equatable {
  final dynamic product;
  final String? variant1stId;
  final String? variant2ndId;
  final dynamic stocks;
  final num quantity;
  final BUYTYPE buytype;
  final bool addedToCard;

  const VariantsState(
      {this.product,
      this.variant1stId,
      this.variant2ndId,
      required this.quantity,
      this.buytype = BUYTYPE.ecommerce,
      this.stocks,
      this.addedToCard = false});


  VariantsState copyWith({
    dynamic product,
    String? variant1stId,
    String? variant2ndId,
    dynamic stocks,
    num? quantity,
    BUYTYPE? buytype,
    bool? addedToCard,
  }) {
    return VariantsState(
        product: product ?? this.product,
        variant1stId: variant1stId ?? this.variant1stId,
        variant2ndId: variant2ndId ?? this.variant2ndId,
        stocks: stocks ?? this.stocks,
        buytype: buytype ?? this.buytype,
        quantity: quantity ?? this.quantity,
        addedToCard: addedToCard ?? this.addedToCard,
    );
  }
  @override
  List<Object?> get props =>
      [product, variant1stId, variant2ndId, stocks, quantity, addedToCard];

  @override
  String toString() {
    return 'VariantsState{product: $product, variant1stId: $variant1stId, variant2ndId: $variant2ndId, stocks: $stocks, quantity: $quantity, buytype: $buytype}';
  }
}
