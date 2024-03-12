import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/features/request_open_shop_page/bloc/request_to_open_shop_controller.dart';
import 'package:shared_module/features/request_open_shop_page/model/countries.dart';
import 'package:shared_module/features/request_open_shop_page/model/district.dart';
import 'package:shared_module/features/request_open_shop_page/model/logo_shop.dart';
import 'package:shared_module/features/request_open_shop_page/model/provinces.dart';
import 'package:shared_module/features/request_open_shop_page/model/send_request_open_shop.dart';
import 'package:shared_module/features/request_open_shop_page/model/ward.dart';
import '../../../models/auth_model.dart';
import '../../../shared_module.dart';
import '../../auth/auth_controller.dart';
import '../model/data_attachment.dart';
import '../model/model.dart';
import '../widgets/input_field.dart';
part 'request_to_open_shop_event.dart';
part 'request_to_open_shop_state.dart';

class RequestToOpenShopBloc
    extends Bloc<RequestToOpenShopEvent, RequestToOpenShopState> {

  final RequestToOpenShopController requestToOpenShopController = RequestToOpenShopController(SharedModule.appDelegates!.dio);
  List<DataAttachments> attachmentsData = [];

  RequestToOpenShopBloc() : super(const RequestToOpenShopState()) {
    on<ChangeOfflineStoreOption>(
      (event, emit) {
        emit(state.copyWith(offlineStore: !state.offlineStore));
      },
    );

    on<HandleSelectedProvince>((event,emit) async {
      emit(state.copyWith(selectedDistrict: null));
      final dataDistrict = await requestToOpenShopController.getListDistrictByProvinceId((event.city.provinceId ?? ''));
      emit(state.copyWith(
          selectedProvinces: Optional.of(event.city),
          district: Optional.of(dataDistrict),
          selectedDistrict: Optional.empty(),
          selectedWard: Optional.empty(),
      ));
    });

    on<HandleSelectedDistrict>((event,emit) async {
      final data = await requestToOpenShopController.getListWardByDistrictId((event.district.districtId ?? ''));
      emit(state.copyWith(
          selectedDistrict: Optional.of(event.district),
          ward: Optional.of(data),
          selectedWard: Optional.empty()
      ));
    });

    on<HandleSelectedWard>((event,emit) async {
      emit(state.copyWith(selectedWard: Optional.of(event.ward)));
    });

    on<UploadLogoShop>((event,emit) async {
      var formData = FormData.fromMap({});
        formData.files.addAll([
          MapEntry(
              "file",
              await MultipartFile.fromFile(event.file.path,
                  filename: " image.JPEG"))
        ]);

      final data = await requestToOpenShopController.handlePostLogoShop(formData);
      emit(state.copyWith(logoShop:  Optional.of(data)));
    });

    on<UploadAttachments>((event,emit) async {
      var formData = FormData.fromMap({});
      for (int i = 0; i < event.files.length; i++) {
        formData.files.addAll([
          MapEntry(
              "files",
              await MultipartFile.fromFile(event.files[i].path,
                  filename: " image.JPEG"))
        ]);
      }
      List<DataFile> attachments = await requestToOpenShopController.handlePostListAttachment(formData);
      for(var i =0;i<attachmentsData.length;i++){
        if(attachmentsData[i].index == event.index){
          attachmentsData.remove(attachmentsData[i]);
        }
      }
      for(var data in attachments){
        attachmentsData.add(DataAttachments(dataFile: data ,index: event.index));
      }
      emit(state.copyWith(dataAttachments:  Optional.of(attachmentsData)));
    });

    on<ChangeInputFieldAttachment>((event,emit) async {
      AdvancedModel advancedModel = AdvancedModel(
        addressAdvance: event.advancedModel.addressAdvance,
        googleMapUrl: event.advancedModel.googleMapUrl,
        longitude: event.advancedModel.longitude,
        latitude: event.advancedModel.latitude
      );
      emit(state.copyWith(advancedModel: advancedModel));
    });

    on<ChangeInputFieldUser>((event,emit) async {
      UserModel userModel = UserModel(
          fullName: event.userModel.fullName,
          email: event.userModel.email,
          phoneNumber: event.userModel.phoneNumber,
          idCard: event.userModel.idCard
      );
      emit(state.copyWith(userModel: userModel));
    });

    on<ChangeInputFieldShop>((event,emit) async {
      ShopModel shopModel = ShopModel(
          addressShop: event.shopModel.addressShop,
          merchantName: event.shopModel.merchantName,
          subStreet: event.shopModel.subStreet
      );
      emit(state.copyWith(shopModel: shopModel));
    });

    on<SendRequest>((event,emit) async {

      CountryRequest countryRequest = CountryRequest(
        id: event.country?.countryId,
        code: event.country?.codeName,
        name: event.country?.countryName,
      );

      ProvinceRequest cityRequest = ProvinceRequest(
        id: event.province?.provinceId,
        code: event.province?.codeName,
        name:event.province?.provinceName
      );

      DistrictRequest districtRequest = DistrictRequest(
        id: event.district?.districtId,
        code: event.district?.codeName,
        name: event.district?.districtName
      );

      WardRequest wardRequest = WardRequest(
          id: event.ward?.wardId,
          code: event.ward?.codeName,
          name: event.ward?.wardName
      );

      Avatar avatar = Avatar(
        id: event.avatar?.id,
        description:  event.avatar?.description,
        extension:  event.avatar?.extension,
        originalName:  event.avatar?.originalName,
        size:  event.avatar?.size,
        type:  event.avatar?.type
      );
      List<AttachmentDTO>? attachmentDTOs = event.attachments?.map((e) => AttachmentDTO(
        id: e.dataFile.id,
        extension:  e.dataFile.extension,
        originalName: e.dataFile.originalName,
        size: e.dataFile.size,
        type: e.dataFile.type,
        description: e.dataFile.description,
      )).toList();

      Map<String,dynamic> attachments = {};
      for(int i=0;i < attachmentDTOs!.length ;i++){
        attachments['additionalProp${i+1}'] = attachmentDTOs[i];
      }

      DateTime openTime = DateTime.now();
      DateTime dateTimeOpen = DateTime(
        openTime.year,
        openTime.month,
        openTime.day,
        event.openTime!.hour,
        event.openTime!.minute,
      );

      DateTime closeTime = DateTime.now();
      DateTime dateTimeClose = DateTime(
        closeTime.year,
        closeTime.month,
        closeTime.day,
        event.closedTime!.hour,
        event.closedTime!.minute,
      );

      SendRequestOpenShop request = SendRequestOpenShop(
          event.name,
          event.ownerName,
          event.phone,
          countryRequest,
          cityRequest,
          districtRequest,
          wardRequest,
          event.street,
          event.subStreet,
          event.email,
          event.idCard,
          dateTimeOpen,
          dateTimeClose,
          event.workingDays,
          event.address,
          event.googleMapUrl,
          event.longitude,
          event.latitude,
          avatar,
          attachments,
      );
      final data = await requestToOpenShopController.handleCreateNewShop(request);
      emit(state.copyWith(
          shopModel: ShopModel(merchantName: data.name ?? "", addressShop: data.address ?? "", subStreet: data.subStreet ?? ""),
          userModel: UserModel(fullName: data.ownerName ?? "", email: data.email ?? "", phoneNumber: data.phone ?? "", idCard: data.idCard ?? ""),
      ));
    });

    on<ChangeTimes>(
      (event, emit) {
        event.opening
            ? emit(state.copyWith(openingTime: event.newTime))
            : emit(state.copyWith(closedTime: event.newTime));
      },
    );

    on<ChangWorkingDays>(
      (event, emit) {
        List<bool> newIndexList = [...state.workingDays.indexList];
        newIndexList[event.index] = !newIndexList[event.index];
        emit(
          state.copyWith(
            workingDays: state.workingDays.copyWith(indexList: newIndexList),
          ),
        );
      },
    );

    on<AddAttachment>(
      (event, emit) {
        int newNumOfAttachments = state.attachments.numOfAttachments;
        if (newNumOfAttachments <= 3) {
          newNumOfAttachments += 1;
          emit(
            state.copyWith(
              attachments: state.attachments
                  .copyWith(numOfAttachments: newNumOfAttachments),
            ),
          );
        }
      },
    );

    on<DeleteAttachment>(
      (event, emit) {
        int numOfAttachments = state.attachments.numOfAttachments;
        if (numOfAttachments >= 2) {
          emit(
            state.copyWith(
              attachments: state.attachments
                  .copyWith(numOfAttachments: numOfAttachments - 1),
            ),
          );
          switch (event.index) {
            // 1 is for prop1, 2 prop2, 3 prop3
            case 1:
              emit(
                state.copyWith(
                  attachments: state.attachments.copyWith(
                    prop1: state.attachments.prop2,
                    prop2: state.attachments.prop3,
                    prop3: const Attachment(),
                  ),
                ),
              );
              break;
            case 2:
              emit(
                state.copyWith(
                  attachments: state.attachments.copyWith(
                    prop2: state.attachments.prop3,
                    prop3: const Attachment(),
                  ),
                ),
              );
              break;
            case 3:
              emit(
                state.copyWith(
                  attachments: state.attachments.copyWith(
                    prop3: const Attachment(),
                  ),
                ),
              );
              break;
          }
        }
      },
    );
    on<UploadImage>(
      (event, emit) async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
          PlatformFile file = result.files.first;
          String fileName = file.name;
          File fileToDisplay = File(file.path.toString());

          switch (event.index) {
            // 0 is for logo, 1 is for prop1, 2 prop2, 3 prop3
            case 0: //logo
              emit(
                state.copyWith(
                  attachments: state.attachments.copyWith(
                    logo: state.attachments.logo.copyWith(
                      original_name: fileName,
                      image: fileToDisplay,
                    ),
                  ),
                ),
              );
              break;
            case 1: //prop1
              emit(
                state.copyWith(
                  attachments: state.attachments.copyWith(
                    prop1: state.attachments.prop1.copyWith(
                      original_name: fileName,
                      image: fileToDisplay,
                      description: event.description,
                    ),
                  ),
                ),
              );
              break;
            case 2: //prop2
              emit(
                state.copyWith(
                  attachments: state.attachments.copyWith(
                    prop2: state.attachments.prop2.copyWith(
                      original_name: fileName,
                      image: fileToDisplay,
                      description: event.description,
                    ),
                  ),
                ),
              );
              break;
            case 3: //prop3
              emit(
                state.copyWith(
                  attachments: state.attachments.copyWith(
                    prop3: state.attachments.prop3.copyWith(
                      original_name: fileName,
                      image: fileToDisplay,
                      description: event.description,
                    ),
                  ),
                ),
              );
              break;
          }
        }
      },
    );

    on<GetListCountries>((event, emit) async {
      final listCountries = await requestToOpenShopController.handleGetListCountries();
        emit(
          state.copyWith(
            listCountries: Optional.of(listCountries)
          ),
        );
      },
    );

    on<HandleSelectedCountries>((event,emit) async {
      final listProvinceByCountriesId = await requestToOpenShopController.getListProvincesByCountryId(event.dataCountries.countryId ?? "");
      emit(state.copyWith(
        selectedCountries:  Optional.of(event.dataCountries),
        provinces:  Optional.of(listProvinceByCountriesId),
        selectedProvinces: Optional.empty(),
        selectedDistrict: Optional.empty(),
      ));
    });

    on<HandleGetUserInformation>((event,emit) async{
      AuthController authController = AuthController.instance;
      String? stringAuthModel = await authController.getAuthModel();
      Map<String, dynamic> valueMap = jsonDecode(stringAuthModel!);

      AuthModel authModel = AuthModel.fromJson(valueMap);
      final userInfo = await requestToOpenShopController.handleGetInformationUser(authModel.user.id);
      UserModel userModel = UserModel(
        fullName: userInfo.fullName ?? "",
        phoneNumber: userInfo.phone ?? "",
        email: userInfo.email ?? ""
      );
      emit(state.copyWith(userModel: userModel));
    });
  }

  String choosingText(bool opening) {
    if (opening && state.openingTime != const TimeOfDay(hour: 0, minute: 0)) {
      return "${state.openingTime.hour}:${state.openingTime.minute == 0 ? "00" : state.openingTime.minute}";
    } else if (!opening &&
        state.closedTime != const TimeOfDay(hour: 0, minute: 0)) {
      return "${state.closedTime.hour}:${state.closedTime.minute == 0 ? "00" : state.closedTime.minute}";
    }
    return "Time";
  }

  List<String> getChosenCategory() {
    List<String> ret = [];
    int length = state.category.categoryList.length;
    for (int i = 0; i < length; i++) {
      if (state.category.indexList[i] == true) {
        ret.add(state.category.categoryList[i]);
      }
    }
    return ret;
  }

  List<String> getChosenProductCategory() {
    List<String> ret = [];
    int length = state.productCategory.categoryList.length;
    for (int i = 0; i < length; i++) {
      if (state.productCategory.indexList[i] == true) {
        ret.add(state.productCategory.categoryList[i]);
      }
    }
    return ret;
  }

  String getTitleWorkingDays() {
    String ret = "";
    for (int i = 0; i < 7; i++) {
      if (state.workingDays.indexList[i] == true) {
        ret += '${state.workingDays.days[i]}, ';
      }
    }

    return ret.substring(0, ret.length - 2);
  }

  Attachment? uploadedTile(int index) {
    switch (index) {
      case 0:
        return state.attachments.logo;
      case 1:
        return state.attachments.prop1;
      case 2:
        return state.attachments.prop2;
      case 3:
        return state.attachments.prop3;
    }
    return null;
  }

  bool sendRequest() {
    AdvancedModel value = state.advancedModel;
    bool checkSelectedTime = state.openingTime.hour <= state.closedTime.hour ||
        (state.openingTime.hour == state.closedTime.hour && state.openingTime.minute <= state.closedTime.minute);

    if (state.offlineStore) {
      return value.addressAdvance != "" &&
          value.googleMapUrl != "" &&
          state.openingTime != const TimeOfDay(hour: 0, minute: 0) &&
          state.closedTime != const TimeOfDay(hour: 0, minute: 0) && checkSelectedTime;
    }
    bool isCheckInputShop = state.shopModel.merchantName.isNotEmpty && state.shopModel.addressShop.isNotEmpty;
    bool isCheckUserInfo = state.userModel.fullName.isNotEmpty && isEmail( state.userModel.email) && state.userModel.phoneNumber.isNotEmpty;
    bool isCheckCountries = state.selectedCountries?.countryId?.isNotEmpty ?? false;
    bool isCheckProvince = state.selectedProvinces?.provinceId?.isNotEmpty ?? false;
    bool isCheckDistrict = state.selectedDistrict?.districtId?.isNotEmpty ?? false;
    return isCheckInputShop && isCheckUserInfo && isCheckCountries && isCheckProvince && isCheckDistrict;
  }

  bool isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }
}
