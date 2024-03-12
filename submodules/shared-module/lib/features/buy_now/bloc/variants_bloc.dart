import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/checkout/view/checkout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/features/my_cart/api/my_cart_controller.dart';
import 'package:shared_module/features/my_cart/model/cart_request.dart';
import 'package:shared_module/features/my_cart/model/cart_response.dart'
    as cart_response;
import 'package:shared_module/shared_module.dart';

part 'variants_event.dart';
part 'variants_state.dart';

class VariantsBloc extends Bloc<VariantsEvent, VariantsState> {
  VariantsBloc(toOrder)
      : super(const VariantsState(
          quantity: 0,
        )) {
    on<SetProductEvent>((event, emit) {
      if (event.product.prices?.length == 0) {
        emit(state.copyWith(
          stocks: (
            price: event.product.price,
            originalPrice: event.product.originalPrice,
            quantity: event.product.quantity,
            productId: event.product.id,
            id: event.product.stocks[0].id,
            variationFirst: null,
            variationSecond: null
          ),
        ));
      }
      emit(state.copyWith(
        product: event.product,
        buytype: event.buytype,
      ));
    });
    on<SetVariant1stEvent>((event, emit) {
      emit(state.copyWith(variant1stId: event.id));
    });
    on<SetVariant2ndEvent>((event, emit) {
      emit(state.copyWith(variant2ndId: event.id));
    });
    on<CalculateVariantEvent>(
      (event, emit) {
        if (state.product != null && state.product!.stocks != null) {
          var result = state.product!.stocks?.firstWhere((element) {
            if (state.variant1stId != null && state.variant2ndId != null) {
              return element.variationFirstId == state.variant1stId &&
                  element.variationSecondId == state.variant2ndId;
            } else {
              return element.variationFirstId == state.variant1stId;
            }
          });
          emit(state.copyWith(stocks: result));
        }
      },
    );
    on<SetBuyQuantityEvent>(
      (event, emit) {
        emit(state.copyWith(quantity: event.quantity));
      },
    );
    on<NavigatorCheckOut>(
      (event, emit) {
        if (state.buytype == BUYTYPE.ecommerce) {
          final List<cart_response.EntityDtos> dataProduct = [];
          final List<cart_response.ObjectDtOs> itemProductInShop = [];
          num discount = 0;
          num deliveryFee = 0;

          itemProductInShop.add(cart_response.ObjectDtOs(
              price: state.stocks?.price ?? state.product?.price ?? 0,
              id: state.product?.id ?? "",
              name: state.product?.name ?? "",
              quantity: state.quantity,
              objectId: state.product?.id ?? '',
              avatar:
                  cart_response.Avatar(id: state.product?.avatar?.id ?? ""),
              stockDetail: cart_response.StockDetail(
                  id: state.stocks?.id,
                  variationFirstName: state.stocks?.variationFirst?.name,
                  variationSecondName: state.stocks?.variationSecond?.name),
              stockId: state.stocks?.id));
          dataProduct.add(cart_response.EntityDtos(
              id: state.product?.shopDetailDTO?.id,
              name: state.product?.shopDetailDTO?.name,
              avatar: cart_response.Avatar(
                  id: state.product?.shopDetailDTO?.avatar?.id),
              objectDTOs: itemProductInShop));
          Navigator.of(event.context).push(MaterialPageRoute(
            builder: (context) {
              return Checkout(
                buyType: BUYTYPE.ecommerce,
                context: context,
                data: dataProduct,
                discount: discount,
                deliveryFee: deliveryFee,
                price: (state.stocks?.price ?? state.product?.price ?? 0) *
                    state.quantity,
                countAllItem: 1,
                toOrder: () {
                  toOrder();
                },
                toHome: () {
                  int count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 4;
                  });
                },
              );
            },
          ));
        } else {
          final List<cart_response.EntityDtos> dataProduct = [];
          final List<cart_response.ObjectDtOs> itemProductInShop = [];
          num discount = 0;
          num deliveryFee = 0;
          itemProductInShop.add(cart_response.ObjectDtOs(
              price: state.stocks?.price ?? state.product?.price ?? 0,
              id: state.product?.id ?? "",
              name: state.product?.name ?? "",
              quantity: state.quantity,
              avatar:
                  cart_response.Avatar(id: state.product?.avatar?.id ?? ""),
              stockDetail: cart_response.StockDetail(
                  id: state.stocks?.id,
                  variationFirstName: state.stocks?.variationFirst?.name,
                  variationSecondName: state.stocks?.variationSecond?.name),
              stockId: state.stocks?.id));
          dataProduct.add(cart_response.EntityDtos(
              id: state.product?.restaurantFood?.id,
              name: state.product?.restaurantFood?.name,
              avatar: cart_response.Avatar(
                  id: state.product?.restaurantFood?.avatar?.id),
              objectDTOs: itemProductInShop));
          Navigator.of(event.context).push(MaterialPageRoute(
            builder: (context) {
              return Checkout(
                buyType: BUYTYPE.food,
                context: context,
                data: dataProduct,
                discount: discount,
                deliveryFee: deliveryFee,
                price: (state.stocks?.price ?? state.product?.price ?? 0) *
                    state.quantity,
                countAllItem: 1,
                toOrder: () {
                  toOrder();
                },
                toHome: () {
                  int count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 4;
                  });
                },
              );
            },
          ));
        }
      },
    );
    on<AddToCartEvent>(
      (event, emit) async {
        emit(state.copyWith(addedToCard: false));
        if (state.buytype == BUYTYPE.ecommerce) {
          if (state.product != null && state.stocks != null) {
            CartRequest dto = CartRequest(
              quantity: state.quantity as int?,
              entityId: state.product?.shop?.id,
              objectType: "PRODUCT",
              note: "",
              objectId: state.product?.id,
              stockId: state.stocks?.id,
            );
            await MyCartController(SharedModule.appDelegates!.dio)
                .addToCart(dto);
            if (event.isBuyNow) {
              emit(state.copyWith(
                  stocks: null, variant1stId: null, variant2ndId: null, addedToCard: true));
            } else {
              emit(state.copyWith(
                  stocks: null, variant1stId: null, variant2ndId: null));
            }
          }
        } else {
          if (state.product != null && state.stocks != null) {
            CartRequest dto = CartRequest(
              quantity: state.quantity as int?,
              entityId: state.product?.restaurantFood?.id,
              objectType: "FOOD",
              note: "",
              objectId: state.product?.id,
              stockId: state.stocks?.id,
            );
            await MyCartController(SharedModule.appDelegates!.dio)
                .addToCart(dto);
            emit(state.copyWith(
                stocks: null, variant1stId: null, variant2ndId: null));
          }
        }
      },
    );
  }
}
