import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/common_widgets/primary_button.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/common_widgets/toast_util.dart';
import 'package:shared_module/constants/AccessHelper.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookBloc.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressBookEvent.dart';
import 'package:shared_module/features/AddressBook/bloc/AddressbookState.dart';
import 'package:shared_module/features/AddressBook/model/DropdownItemModel.dart';
import 'package:shared_module/features/AddressBook/view/_components/_field.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/shared_module.dart';
import 'package:shared_module/utils/package_util.dart';
import '../model/AddressNewModel.dart';
import '_components/_input.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class AddressDetail extends StatefulWidget {
  const AddressDetail({super.key, this.initValue});

  final AddressNewModel? initValue;

  @override
  State<AddressDetail> createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {
  final formKey = GlobalKey<FormState>();
  bool showError = false;
  late AddressNewModel addressNewModel;
  TextEditingController phoneNumber = TextEditingController();
  late String completePhoneNumber;
  late PhoneNumber userPhoneNumber;

  @override
  void initState() {
    super.initState();
    addressNewModel = widget.initValue ?? AddressNewModel();
    completePhoneNumber = addressNewModel.userPhoneNumber != null
        ? addressNewModel.userPhoneNumber!
        : "";
    userPhoneNumber = PhoneNumber.fromCompleteNumber(completeNumber: completePhoneNumber);
    if(userPhoneNumber.countryCode == "1") {
      userPhoneNumber.countryISOCode = "US";
    }
    userPhoneNumber.countryCode = "+${userPhoneNumber.countryCode}";
    phoneNumber.text = userPhoneNumber.number;
  }

  Widget addressType(bool check, String content, String icon) {
    return Container(
      decoration: BoxDecoration(
          color: check ? Colors.blue.shade50 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          package.createSvgFromAsset(icon,
              colorFilter: ColorFilter.mode(
                  check ? ColorPalette.primary700 : ColorPalette.gray500,
                  BlendMode.srcIn),
              height: 12.0,
              width: 12.0),
          const SizedBox(
            width: 4,
          ),
          Text(
            content,
            style: TextStyle(
                color: check ? ColorPalette.primary700 : ColorPalette.gray500,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _checkBox(Function() onTap, bool value) {
    return InkWell(
      onTap: onTap,
      child: icon.SoctripIcon(
        !value ? icon.Icons.square : icon.Icons.solidCheckSquare,
        style: TextStyle(
            fontSize: 20.0,
            color: !value ? ColorPalette.gray300 : ColorPalette.primary700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget phoneInput(String label, TextEditingController controller,
        String hintText, Function(PhoneNumber phone) onChane) {
      bool hidden = true;
      FocusNode focusNode = FocusNode();
      return StatefulBuilder(builder: (_, setState) {
        return IntlPhoneField(
          initialCountryCode: completePhoneNumber != ""
              ? userPhoneNumber.countryISOCode
              : countryCode,
          focusNode: focusNode,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorPalette.gray900),
          controller: controller,
          showCountryFlag: true,
          disableLengthCheck: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            counterText: "",
            errorStyle: const TextStyle(color: ColorPalette.error600),
            errorText: (showError && controller.text.isEmpty)
                ? (hidden
                    ? SharedLocalizations.of(context)!.requiredAddress
                    : null)
                : null,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: ColorPalette.gray300,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorPalette.primary,
                ),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorPalette.gray300, width: 1),
                borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorPalette.gray300),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: showError
                        ? ColorPalette.error600
                        : ColorPalette.gray300),
                borderRadius: BorderRadius.circular(8)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorPalette.gray300),
                borderRadius: BorderRadius.circular(8)),
          ),
          languageCode: SharedLocalizations.of(context)!.localeName,
          validator: (PhoneNumber? phone) {
            if ((phone == null || phone.number.isEmpty) && showError) {
              setState(() {
                hidden = false;
              });
              return SharedLocalizations.of(context)!.requiredAddress;
            }
            setState(() {
              hidden = false;
              return;
            });
            return null;
          },
          onChanged: (phone) {
            setState(() {
              userPhoneNumber = phone;
            });
          },
          onCountryChanged: (country) {
            setState(() {
              userPhoneNumber.countryISOCode = country.code;
              userPhoneNumber.countryCode = "+${country.dialCode}" ;
            });
          },
        );
      });
    }

    Widget itemListView(content, isSelect) => SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                  width: 40,
                  height: 40,
                  child: icon.SoctripIcon(
                    icon.Icons.check,
                    style: TextStyle(
                        color:
                            isSelect ? ColorPalette.primary600 : Colors.white),
                  )),
            ],
          ),
        );

    ListView listView(List<DropdownItemModel> data, String value,
            Function(DropdownItemModel data) onTap) =>
        ListView(
          shrinkWrap: true,
          children: data
              .map((e) => GestureDetector(
                  onTap: () {
                    onTap(e);
                    Navigator.of(context).pop();
                  },
                  child: itemListView(e.name, e.name == value)))
              .toList(),
        );

    return BlocBuilder<AddressBookBloc, AddressBookState>(
      builder: (context, addressBookState) {
        Widget defaultAddress() {
          return Container(
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _checkBox(() {
                  setState(() {
                    addressNewModel = addressNewModel.copyWith(
                        isDefault: !(addressNewModel.isDefault ?? false));
                  });
                }, addressNewModel.isDefault ?? false),
                const SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                      SharedLocalizations.of(context)!.setAsDefaultAddress,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.gray700)),
                )
              ],
            ),
          );
        }

        Widget _addressType() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(SharedLocalizations.of(context)!.addressType,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.gray700)),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          addressNewModel =
                              addressNewModel.copyWith(addressType: typeHOME);
                        });
                      },
                      child: addressType(
                          addressNewModel.addressType == typeHOME ||
                              addressNewModel.addressType == null,
                          SharedLocalizations.of(context)!.home,
                          AssetHelper.homeIcon),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        addressNewModel =
                            addressNewModel.copyWith(addressType: typeOffice);
                      });
                    },
                    child: addressType(
                        addressNewModel.addressType == typeOffice,
                        SharedLocalizations.of(context)!.office,
                        AssetHelper.officeIcon),
                  )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              defaultAddress(),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        }

        applyButton(AddressBookState addressBookState) => PrimaryButton(
              addressBookState.currentAddress?.id != null
                  ? SharedLocalizations.of(context)!.save
                  : SharedLocalizations.of(context)!.create,
              onPressed: () {
                addressNewModel = addressNewModel.copyWith(userPhoneNumb: userPhoneNumber.completeNumber);
                if (addressNewModel.validate()) {
                  setState(() {
                    showError = true;
                  });
                } else {
                  if (addressNewModel.id != null) {
                    context.read<AddressBookBloc>().add(
                        UpdateAddress(addressNewModel, addressNewModel.id!));
                  } else {
                    context
                        .read<AddressBookBloc>()
                        .add(CreateAddress(addressNewModel));
                  }
                  Navigator.of(context).pop();
                }
              },
            );

        deleteDialog() => GestureDetector(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext contextDialog) => AlertDialog(
                  title: Text(SharedLocalizations.of(context)!.deleteAddress),
                  content: Text(
                      SharedLocalizations.of(context)!.confirmDeleteAddress),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(SharedLocalizations.of(context)!.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        if (addressNewModel.isDefault == true) {
                          ToastUtil.show(context,SharedLocalizations.of(context)!.notDeleteAddressDefault,status: ToastStatus.warning);
                          Navigator.of(context).pop();
                        } else {
                          context
                              .read<AddressBookBloc>()
                              .add(DeleteAddress(addressNewModel.id!));

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(SharedLocalizations.of(context)!.ok),
                    ),
                  ],
                ),
              ),
              child: Container(
                  padding: const EdgeInsets.only(top: 2),
                  alignment: AlignmentDirectional.center,
                  height: 40,
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      package.createSvgFromAsset(AssetHelper.deleteIcon,
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              ColorPalette.red700, BlendMode.srcIn)),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        SharedLocalizations.of(context)!.deleteAddress,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorPalette.red700),
                      )
                    ],
                  )),
            );

        Widget dialogForDropDown(String title, List<DropdownItemModel> data,
                String value, Function(DropdownItemModel data) onTap) =>
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: ColorPalette.gray900),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const icon.SoctripIcon(
                                icon.Icons.xClose,
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: listView(
                      data,
                      value,
                      onTap,
                    ))
                  ],
                ),
              ),
            );

        content(AddressNewModel crudAddressModel) => Column(
              children: [
                FieldWidget(
                    label: SharedLocalizations.of(context)!.fullName,
                    child: InputWidget(
                      initValue: addressNewModel.userFullName,
                      hintText: SharedLocalizations.of(context)!.fullName,
                      showError: showError,
                      handleValue: (String value) {
                        if (value != addressNewModel.userFullName) {
                          setState(() {
                            addressNewModel =
                                addressNewModel.copyWith(userFullName: value);
                          });
                        }
                      },
                    )),
                const SizedBox(
                  height: 8,
                ),
                FieldWidget(
                  label: SharedLocalizations.of(context)!.phoneNumber,
                  child: phoneInput(
                      SharedLocalizations.of(context)!.phoneNumber,
                      phoneNumber,
                      phoneNumberHintText,
                      (phone) {}),
                ),
                const SizedBox(
                  height: 8,
                ),
                FieldWidget(
                    label: SharedLocalizations.of(context)!.streetName,
                    child: InputWidget(
                      hintText: SharedLocalizations.of(context)!.streetName,
                      showError: showError,
                      handleValue: (String value) {
                        if (value != addressNewModel.address) {
                          setState(() {
                            addressNewModel =
                                addressNewModel.copyWith(address: value);
                          });
                        }
                      },
                      initValue: addressNewModel.address,
                    )),
                const SizedBox(
                  height: 8,
                ),
                FieldWidget(
                    label: SharedLocalizations.of(context)!.country,
                    child: InputWidget(
                      showError: showError,
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (_) {
                            return dialogForDropDown(
                                SharedLocalizations.of(context)!.country,
                                addressBookState.countryList,
                                addressNewModel.country ?? "",
                                (DropdownItemModel data) {
                              context
                                  .read<AddressBookBloc>()
                                  .add(GetDataProvince(data.id));
                              setState(() {
                                addressNewModel.clearCity();
                                addressNewModel.clearDistrict();
                                addressNewModel.clearWard();
                                addressNewModel = addressNewModel.copyWith(
                                  country: data.name,
                                  countryCode: data.code.toString(),
                                  countryId: data.id,
                                );
                              });
                            });
                          },
                        );
                      },
                      readOnly: true,
                      hintText: SharedLocalizations.of(context)!.country,
                      initValue: addressNewModel.country,
                      handleValue: (String value) {},
                    )),
                const SizedBox(
                  height: 8,
                ),
                FieldWidget(
                    label: SharedLocalizations.of(context)!.city,
                    child: InputWidget(
                      showError: showError,
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (_) {
                            return dialogForDropDown(
                                SharedLocalizations.of(context)!.city,
                                addressBookState.provinceList,
                                crudAddressModel.city ?? "",
                                (DropdownItemModel data) {
                              context
                                  .read<AddressBookBloc>()
                                  .add(GetDataDistrict(data.id));
                              setState(() {
                                addressNewModel.clearDistrict();
                                addressNewModel.clearWard();
                                addressNewModel = addressNewModel.copyWith(
                                  city: data.name,
                                  cityCode: data.code.toString(),
                                  cityId: data.id,
                                );
                              });
                            });
                          },
                        );
                      },
                      readOnly: true,
                      hintText: SharedLocalizations.of(context)!.city,
                      initValue: addressNewModel.city,
                      handleValue: (String value) {},
                    )),
                const SizedBox(
                  height: 8,
                ),
                FieldWidget(
                    label: SharedLocalizations.of(context)!.district,
                    child: InputWidget(
                      showError: showError,
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (_) {
                            return dialogForDropDown(
                                SharedLocalizations.of(context)!.district,
                                addressBookState.districtList,
                                addressNewModel.district ?? "",
                                (DropdownItemModel data) {
                              context
                                  .read<AddressBookBloc>()
                                  .add(GetDataWard(data.id));
                              setState(() {
                                addressNewModel.clearWard();
                                addressNewModel = addressNewModel.copyWith(
                                  district: data.name,
                                  districtCode: data.code.toString(),
                                  districtId: data.id,
                                );
                              });
                            });
                          },
                        );
                      },
                      readOnly: true,
                      hintText: SharedLocalizations.of(context)!.district,
                      initValue: addressNewModel.district,
                      handleValue: (String value) {},
                    )),
                const SizedBox(
                  height: 8,
                ),
                FieldWidget(
                    label: SharedLocalizations.of(context)!.ward,
                    child: InputWidget(
                      showError: showError,
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (_) {
                            return dialogForDropDown(
                                SharedLocalizations.of(context)!.ward,
                                addressBookState.wardList,
                                crudAddressModel.ward ?? "",
                                (DropdownItemModel data) {
                              setState(() {
                                addressNewModel = addressNewModel.copyWith(
                                  ward: data.name,
                                  wardCode: data.code.toString(),
                                  wardId: data.id,
                                );
                              });
                            });
                          },
                        );
                      },
                      readOnly: true,
                      hintText: SharedLocalizations.of(context)!.ward,
                      initValue: crudAddressModel.ward,
                      handleValue: (value) {},
                    )),
                const SizedBox(
                  height: 8,
                ),
                _addressType(),
              ],
            );
        return Scaffold(
          backgroundColor: ColorPalette.primary25,
          appBar: MainAppBar(
            titleAppbar: addressNewModel.id == null
                ? SharedLocalizations.of(context)!.addNewAddress
                : SharedLocalizations.of(context)!.editAddress,
          ),
          body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.all(16),
                      child: content(addressNewModel)),
                  Container(
                    color: ColorPalette.primary25,
                    height: 16,
                  ),
                  addressNewModel.id != null ? deleteDialog() : Container(),
                  Container(
                    color: ColorPalette.primary25,
                    height: 16,
                  ),
                ]),
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
              height: 88,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        SharedLocalizations.of(context)!.cancel,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(child: applyButton(addressBookState))
                  ],
                ),
              )),
        );
      },
    );
  }
}
