part of 'variants_bloc.dart';

abstract class VariantsEvent extends Equatable {
  const VariantsEvent();
}

class SetProductEvent extends VariantsEvent {
  final dynamic product;
  final BUYTYPE buytype;

  const SetProductEvent(this.product, this.buytype);

  @override
  List<Object?> get props => [product];
}

class SetVariant1stEvent extends VariantsEvent {
  final String id;

  const SetVariant1stEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class SetVariant2ndEvent extends VariantsEvent {
  final String id;

  const SetVariant2ndEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class CalculateVariantEvent extends VariantsEvent {
  const CalculateVariantEvent();

  @override
  List<Object?> get props => [];
}

class SetBuyQuantityEvent extends VariantsEvent {
  final num quantity;
  const SetBuyQuantityEvent(this.quantity);

  @override
  List<Object?> get props => [quantity];
}

class AddToCartEvent extends VariantsEvent {
  final bool isBuyNow;
  const AddToCartEvent({required this.isBuyNow});

  @override
  List<Object?> get props => [isBuyNow];
}

class NavigatorCheckOut extends VariantsEvent {
  const NavigatorCheckOut({required this.context});
  final BuildContext context;
  @override
  List<Object?> get props => [context];
}
