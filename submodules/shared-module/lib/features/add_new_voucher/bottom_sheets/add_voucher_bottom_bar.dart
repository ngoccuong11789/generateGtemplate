import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/common_widgets/common_info_popup.dart';
import 'package:shared_module/common_widgets/common_square_check_box.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/features/VoucherManagement/enum/TyppeVoucher.dart';
import 'package:shared_module/features/VoucherManagement/view/voucher_management_view.dart';
import 'package:shared_module/features/add_new_voucher/api/add_voucher_controller.dart';
import 'package:shared_module/features/add_new_voucher/bloc/add_voucher_bloc.dart';
import 'package:shared_module/features/add_new_voucher/models/add_voucher_request.dart';
import 'package:shared_module/features/voucher_preview/views/voucher_preview_screen.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/utils/dialog.dart';
import 'package:shared_module/utils/loading.dart';

class AddVoucherBottomBar extends StatefulWidget {
  const AddVoucherBottomBar({super.key});

  @override
  State<AddVoucherBottomBar> createState() => _AddVoucherBottomBarState();
}

class _AddVoucherBottomBarState extends State<AddVoucherBottomBar> {
  bool isPublish = false;
  late Loading loading;

  @override
  void initState() {
    loading = Loading(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddVoucherBloc bloc = context.read<AddVoucherBloc>();
    AddVoucherState state = bloc.state;
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFEAECF0)),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0C101828),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonSquareCheckBox(
            value: isPublish,
            onChanged: (value) {
              setState(() {
                isPublish = value!;
              });
              bloc.add(TogglePublish(value!));
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SharedLocalizations.of(context)!.publish,
                style: const TextStyle(
                  color: Color(0xFF344054),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SecondaryButton(
                  SharedLocalizations.of(context)!.preview,
                  onPressed: () {
                    bloc.validatedAddVoucher(onSuccess: () {
                      var data =  getDataRequest(state, isPreview: true);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) {
                          return VoucherPreview(
                            addVoucherRequest: data,
                          );
                        },
                      ));
                    }, onError:  (error) => onErrorValidated(error, context));
                  },
                ),
                const SizedBox(width: 12),
                PrimaryButton(
                  SharedLocalizations.of(context)!.save,
                  onPressed: () async {
                    bloc.validatedAddVoucher(onSuccess: () async {
                      print("objectssssss: ${DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(
                          state.endDate)}");
                      var result = getDataRequest(state);
                      try {
                        if (state.buytype == BUYTYPE.ecommerce) {
                          await AddVoucherController(SharedModule.appDelegates!.dio)
                              .addVoucher(result);
                        } else {
                          await AddVoucherController(SharedModule.appDelegates!.dio)
                              .addRestaurantVoucher(result);
                        }
                        TypeVoucher type = state.buytype == BUYTYPE.ecommerce
                            ? TypeVoucher.SHOP
                            : TypeVoucher.RESTAURANT;

                        loading.startLoading();
                        await Future.delayed(const Duration(seconds: 2));
                        loading.stopLoading();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return VoucherManagement(typeVoucher: type);
                          },
                        ));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            CommonInfoPopup(
                                info: SharedLocalizations.of(context)!
                                    .voucherAlreadyExist));
                        print(e);
                      }
                      print(result.toJson());
                    }, onError: (error) => onErrorValidated(error, context));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AddVoucherRequest getDataRequest(AddVoucherState state, {bool isPreview = false}) {
    return AddVoucherRequest(
      voucherStatus: "ACTIVE",
      usedCount: 0,
      description: state.description,
      discountAmount: state.discountAmount,
      discountType: state.discountType,
      displaySetting: state.displaySetting,
      endDate: isPreview ? state.endDate.compareTo(DateTime(2050, 1, 1)) == 0 ? null : DateFormat(SharedLocalizations.of(context)!.datetimeFormatForCalendar).format(state.endDate.toLocal()) : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(state.endDate),
      isApplicableAll: state.isApplicableAll,
      isPublic: state.isPublic,
      isLimitDiscountPrice: state.isLimitDiscountPrice,
      isLimitUsage: state.isLimitUsage,
      maxDiscountPrice: state.maxDiscountPrice,
      maxUsageCount: state.maxUsageCount,
      name: state.name,
      paymentTypeId: isPreview ? state.paymentTypeId.name : state.paymentTypeId.id,
      platform: !isPreview ? state.platform : state.platform == "ALL" ? SharedLocalizations.of(context)!.allPlatforms : state.platform == "WEB" ? SharedLocalizations.of(context)!.web : SharedLocalizations.of(context)!.app,
      startDate: isPreview ? DateFormat(SharedLocalizations.of(context)!.datetimeFormatForCalendar).format(state.startDate.toLocal()) :
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(state.startDate),
      voucherCode: state.voucherCode,
      voucherTypeId: state.voucherTypeId.id,
      minimumOrderPrice: state.minimumOrderPrice,
      maximumUsagePerUserCount: state.maximumUsagePerUserCount,
      elementIds: state.elementIds,
      categoryId: state.category.id,
      areaIds: state.areas.map((e) => e.countryId!).toList()
    );
  }

  void onErrorValidated(AddVoucherError error, BuildContext context) {
    String message = "";
    switch (error) {
      case AddVoucherError.missField:
      message = SharedLocalizations.of(context)!.missBasicInformation;
      break;
      case AddVoucherError.missValidPeriod:
      message = SharedLocalizations.of(context)!.missValidPeriod;
      break;
      case AddVoucherError.missProduct:
      message = SharedLocalizations.of(context)!.missProduct;
      break;
      case AddVoucherError.missCategory:
      message = SharedLocalizations.of(context)!.missCategory;
      break;
      case AddVoucherError.missVoucherSetting:
      message = SharedLocalizations.of(context)!.missVoucherSetting;
      break;
      case AddVoucherError.missDetailInformation:
      message = SharedLocalizations.of(context)!.missDetailInformation;
      break;
    }
    if(message.isNotEmpty) showErrorDialog(context: context, title: SharedLocalizations.of(context)!.error, message: message, btnOkText: SharedLocalizations.of(context)!.ok);
  }

}
