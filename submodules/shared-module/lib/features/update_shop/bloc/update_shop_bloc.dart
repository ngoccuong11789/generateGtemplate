import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/features/update_shop/bloc/update_shop_controller.dart';
import 'package:shared_module/features/update_shop/model/countries.dart';
import 'package:shared_module/features/update_shop/model/district.dart';
import 'package:shared_module/features/update_shop/model/provinces.dart';
import 'package:shared_module/features/update_shop/model/shop_model_update.dart';
import 'package:shared_module/features/update_shop/model/update_shop_request.dart';
import 'package:shared_module/features/update_shop/model/user_update_model.dart';
import 'package:shared_module/shared_module.dart';

part 'update_shop_event.dart';
part 'update_shop_state.dart';

class UpdateShopBloc extends Bloc<UpdateShopEvent, UpdateShopState> {

  final UpdateShopController updateShopController = UpdateShopController(SharedModule.appDelegates!.dio);

  UpdateShopBloc() : super(const UpdateShopState()) {

    on<HandleGetListCountries>((event, emit) async {
      final listCountries = await updateShopController.getListCountries();
      emit(
        state.copyWith(
            listCountries: Optional.of(listCountries)
        ),
      );
    });

    on<HandleSelectedCountries>((event,emit) async {
      final listProvinceByCountriesId = await updateShopController.getListProvincesByCountryId(event.countries.countryId ?? "");
      emit(state.copyWith(
        selectedCountries:  Optional.of(event.countries),
        listProvinces:  Optional.of(listProvinceByCountriesId),
        selectedProvince: Optional.empty(),
        selectedDistrict: Optional.empty(),
      ));
    });

    on<HandleSelectedProvinces>((event,emit) async {
      final dataDistrict = await updateShopController.getListDistrictByProvinceId((event.provinces.provinceId ?? ''));
      emit(state.copyWith(
        selectedProvince: Optional.of(event.provinces),
        listDistrict: Optional.of(dataDistrict),
        selectedDistrict: Optional.empty(),
      ));
    });

    on<HandleSelectedDistrict>((event,emit) async {
      emit(state.copyWith(
          selectedDistrict: Optional.of(event.district),
      ));
    });

    on<HandleGetShopInformation>((event,emit) async {
      final shopInfo = await updateShopController.getShopInformation();

      ShopModelUpdate shopModelUpdate = ShopModelUpdate(
        merchantName: shopInfo.name ?? "",
        addressLineOne: shopInfo.address ?? "",
        addressLineTwo: shopInfo.subStreet ?? "",
      );

      UserModelUpdate userModelUpdate = UserModelUpdate(
        email: shopInfo.email ?? "",
        phoneNumber: shopInfo.phone ?? "",
        fullName: shopInfo.ownerName ?? ""
      );

      Countries countries = Countries(
        countryId: shopInfo.country?.id,
        codeName: shopInfo.country?.code,
        countryName: shopInfo.country?.name
      );

      Provinces provinces = Provinces(
          provinceId: shopInfo.province?.id,
          codeName: shopInfo.province?.code,
          provinceName: shopInfo.province?.name,
          countryId: shopInfo.country?.id
      );

      District district = District(
          districtId: shopInfo.district?.id,
          codeName: shopInfo.district?.code,
          districtName: shopInfo.district?.name,
          provinceId: shopInfo.province?.id,
      );

      List<Provinces> listProvince = await updateShopController.getListProvincesByCountryId(shopInfo.country?.id ?? "");

      List<District> listDistrict = await updateShopController.getListDistrictByProvinceId(shopInfo.province?.id ?? "");

      emit(state.copyWith(
        shopModelUpdate: shopModelUpdate,
        userModelUpdate: userModelUpdate,
        listProvinces: Optional.of(listProvince),
        listDistrict: Optional.of(listDistrict),
        selectedCountries: Optional.of(countries),
        selectedProvince: Optional.of(provinces),
        selectedDistrict: Optional.of(district),
      ));
    });

    on<HandleChangeExportElectronicInvoicesOption>((event,emit) async {
      emit(state.copyWith(
        isInvoiceExact: !state.isInvoiceExact,
      ));
    });

    on<HandleSendRequestUpdateShop>((event,emit) async {
      final shopInfo = await updateShopController.getShopInformation();

      CountryRequest countryRequest = CountryRequest(
        id: event.country?.countryId,
        code: event.country?.codeName,
        name: event.country?.countryName
      );

      ProvinceRequest provinceRequest = ProvinceRequest(
          id: event.province?.provinceId,
          code: event.province?.codeName,
          name: event.province?.provinceName
      );

      DistrictRequest districtRequest = DistrictRequest(
          id: event.district?.districtId,
          code: event.district?.codeName,
          name: event.district?.districtName
      );

      UpdateShopRequest request = UpdateShopRequest(
        name: event.name,
        ownerName: shopInfo.ownerName,
        phone: shopInfo.phone,
        country: countryRequest,
        province: provinceRequest,
        district: districtRequest,
        subStreet: event.subStreet,
        email: shopInfo.email,
        address: event.address,
        isInvoiceExact: event.isInvoiceExact,
      );
      await updateShopController.handleUpdateShopInformation(shopInfo.id ?? "", request);
    });

    on<ChangeInputFieldShop>((event,emit) async {
      ShopModelUpdate shopModelUpdate = ShopModelUpdate(
          addressLineOne: event.shopModelUpdate.addressLineOne,
          merchantName: event.shopModelUpdate.merchantName,
          addressLineTwo: event.shopModelUpdate.addressLineTwo
      );
      emit(state.copyWith(shopModelUpdate: shopModelUpdate));
    });
  }
  bool sendRequest(){
    bool isCheckRestaurant = state.shopModelUpdate.merchantName.isNotEmpty && state.shopModelUpdate.addressLineOne.isNotEmpty;
    bool isCheckCountries = state.selectedCountries?.countryId?.isNotEmpty ?? false;
    bool isCheckProvince = state.selectedProvince?.provinceId?.isNotEmpty ?? false;
    bool isCheckDistrict = state.selectedDistrict?.districtId?.isNotEmpty ?? false;
    return isCheckRestaurant && isCheckCountries && isCheckProvince && isCheckDistrict;
  }
}
