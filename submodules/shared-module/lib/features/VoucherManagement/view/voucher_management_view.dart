import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_module/common_widgets/AppBar/view/main_appbar.dart';
import 'package:shared_module/common_widgets/ListViewCustom.dart';
import 'package:shared_module/common_widgets/bottom_sheet.dart';
import 'package:shared_module/common_widgets/search_term/model/ConfigListViewModel.dart';
import 'package:shared_module/common_widgets/secondary_button.dart';
import 'package:shared_module/common_widgets/voucher_view/view/voucher_view.dart';
import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/VoucherManagement/enum/TyppeVoucher.dart';
import 'package:shared_module/features/VoucherManagement/model/ItemQuantity.dart';
import 'package:shared_module/features/add_new_voucher/add_new_voucher.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

import '../../../common_widgets/primary_button.dart';
import '../../../constants/AccessHelper.dart';
import '../../../constants/color_palette.dart';
import '../../../utils/package_util.dart';
import '../bloc/voucher_management_bloc.dart';
import '../model/FilterModelForVoucherManagement.dart';
import '../model/TabEnum.dart';
import '../model/VoucherResponseModel.dart';
import 'ItemVoucher.dart';

class VoucherManagement extends StatefulWidget {
  const VoucherManagement(
      {super.key, required this.typeVoucher});

  final TypeVoucher typeVoucher;
 
  @override
  _VoucherManagementState createState() => _VoucherManagementState();
}
class _VoucherManagementState extends State<VoucherManagement> {
  TypeVoucher get typeVoucher => widget.typeVoucher;
  final ScrollController _controller = ScrollController();
  late VoucherManagementBloc bloc;
 @override
  void initState() {
    bloc = VoucherManagementBloc();
    _controller.addListener(_onScroll);
    super.initState();
  }

  void _onScroll({endThresholdReached = 100}) {
    if (!_controller.hasClients || bloc.state.loading) return;

    final thresholdReached =
        _controller.position.extentAfter < endThresholdReached;
    if (thresholdReached) {
      bloc.add(LoadMore(typeVoucher));
    }
  } 

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode =FocusNode();
    return BlocProvider<VoucherManagementBloc>(
        create: (context) => bloc..add(
              ChangePage(typeVoucher: typeVoucher, tabEnum: TabEnum.ALL.code)),
        child: BlocBuilder<VoucherManagementBloc, VoucherManagementState>(
          buildWhen: (previous, current) => previous.tab != current.tab || previous.voucherResponseModel != current.voucherResponseModel || previous.dataHeaderList != current.dataHeaderList,
          builder: (context, state) {
            selectVoucherType(Function(VoucherType voucherType) onTap,
                VoucherType voucherType) {
              showModalBottomSheet<void>(
                context: context,
                builder: (_) {
                  return Container(
                    height: 450,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 32,
                          alignment: AlignmentDirectional.center,
                          child: Container(
                            height: 4,
                            width: 32,
                            color: ColorPalette.gray300,
                          ),
                        ),
                        Text(
                          SharedLocalizations.of(context)!.selectVoucherType,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: ColorPalette.gray900),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: state.voucherType
                              .map((e) =>
                                  itemInVoucherType(e, voucherType == e, () {
                                    onTap(e);
                                    Navigator.of(context).pop();
                                  }))
                              .toList(),
                        )
                      ],
                    ),
                  );
                },
              );
            }

            Future<void> selectDate(
                selectedDate, Function(DateTime) onTap) async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101));
              if (picked != null && picked != selectedDate) {
                onTap(picked);
              }
            }

            filter() {
              FilterModelForVoucherManagement
              filterModelForVoucherManagement =
              FilterModelForVoucherManagement(
                  voucherType:
                  state.filterModelForVoucherManagement.voucherType,
                  startDay:
                  state.filterModelForVoucherManagement.startDay?.toLocal(),
                  endDay: state.filterModelForVoucherManagement.endDay?.toLocal(),
                  noExpiredDate: state
                      .filterModelForVoucherManagement.noExpiredDate,
                  displayVoucher: state
                      .filterModelForVoucherManagement.displayVoucher);
              showModalBottomSheet<void>(
                context: context,
                builder: (_) {
                  return StatefulBuilder(builder: (_, setState) {
                    return Container(
                      height: 458,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 32,
                            alignment: AlignmentDirectional.center,
                            child: Container(
                              height: 4,
                              width: 32,
                              color: ColorPalette.gray300,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                SharedLocalizations.of(context)!.filter,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPalette.gray900),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    filterModelForVoucherManagement =
                                        FilterModelForVoucherManagement(
                                            voucherType:  VoucherType(),
                                            startDay: null,
                                            endDay: null,
                                          );
                                  });
                                },
                                child: Text(
                                  SharedLocalizations.of(context)!.reset,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorPalette.primary),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                SharedLocalizations.of(context)!.voucherType,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorPalette.gray700),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              _input(
                                  filterModelForVoucherManagement
                                      .voucherType?.name,
                                  SharedLocalizations.of(context)!.voucherType,
                                  () {
                                selectVoucherType((data) {
                                  setState(
                                    () {
                                      filterModelForVoucherManagement =
                                          filterModelForVoucherManagement
                                              .copyWith(voucherType: data);
                                    },
                                  );
                                },
                                    filterModelForVoucherManagement
                                        .voucherType!);
                              }, icon.Icons.chevronDown)
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    SharedLocalizations.of(context)!
                                        .validPeriod,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ColorPalette.gray700),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: filterModelForVoucherManagement
                                              .noExpiredDate,
                                          onChanged: (value) {
                                            setState(() {
                                              filterModelForVoucherManagement =
                                                  filterModelForVoucherManagement
                                                      .copyWith(
                                                          startDay:null,
                                                          endDay: null,
                                                          noExpiredDate:
                                                              !filterModelForVoucherManagement
                                                                  .noExpiredDate);
                                            });
                                          }),
                                      Text(
                                        SharedLocalizations.of(context)!
                                            .noExpiredDate,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: ColorPalette.gray700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              _input(
                                  filterModelForVoucherManagement.startDay !=
                                          null
                                      ? getCustomFormattedDateTime(filterModelForVoucherManagement.startDay!, SharedLocalizations.of(context)!.dateFormatForCalendar)
                                      : "",
                                  SharedLocalizations.of(context)!.startDay,
                                  () {
                                !filterModelForVoucherManagement.noExpiredDate
                                    ? selectDate(
                                        filterModelForVoucherManagement.startDay ??
                                            DateTime.now(),
                                        (picked) {
                                          setState(
                                            () {
                                              filterModelForVoucherManagement =
                                                  filterModelForVoucherManagement
                                                      .copyWith(startDay: picked);
                                            },
                                          );
                                        },
                                      )
                                    : () {};
                              }, icon.Icons.calendar),
                              const SizedBox(
                                height: 8,
                              ),
                              _input(
                                  filterModelForVoucherManagement.endDay != null
                                      ? getCustomFormattedDateTime(filterModelForVoucherManagement.endDay!, SharedLocalizations.of(context)!.dateFormatForCalendar)
                                          .toString()
                                      : "",
                                  SharedLocalizations.of(context)!.endDay, () {
                                !filterModelForVoucherManagement.noExpiredDate
                                    ? selectDate(
                                        filterModelForVoucherManagement.endDay ??
                                            DateTime.now(),
                                        (picked) {
                                          setState(
                                            () {
                                              DateTime endDate =  DateTime(picked.year, picked.month, picked.day, 23, 59, 59);
                                              filterModelForVoucherManagement =
                                                  filterModelForVoucherManagement
                                                      .copyWith(endDay: endDate);
                                            },
                                          );
                                        },
                                      )
                                    : () {};
                              }, icon.Icons.calendar),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SecondaryButton(
                                      SharedLocalizations.of(context)!.cancel,
                                      onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: PrimaryButton(
                                      SharedLocalizations.of(context)!.apply,
                                      onPressed: () {
                                    context.read<VoucherManagementBloc>().add(
                                        Filter(filterModelForVoucherManagement,
                                            typeVoucher));
                                    Navigator.of(context).pop();
                                  }),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
                },
              );
            }

            Widget header() {
              return ListView.builder(
                itemCount: state.dataHeaderList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (contextBuilder, position) {
                  TabEnum tab = TabEnum.values[position];
                  ItemQuantity data = state.dataHeaderList[position];
                  return FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        context.read<VoucherManagementBloc>().add(ChangePage(
                            typeVoucher: typeVoucher,
                            tabEnum: data.code));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2,
                                        color: state.tab == tab.code
                                            ? Colors.blue.shade600
                                            : Colors.white))),
                            child: Row(
                              children: [
                                Text(
                                  tab.name + "  ${data.quantity}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: state.tab == data.code
                                          ? Colors.blue.shade600
                                          : Colors.grey.shade500),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                },
              );
            }

            return Scaffold(
              bottomNavigationBar: Container(
                  padding:const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:ColorPalette.gray300,
                          blurRadius: 1.0,
                          spreadRadius: 1,

                        )
                      ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                  ),
                  child: PrimaryButton(
                SharedLocalizations.of(context)!.addNewVoucher,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AddNewVoucher(
                          buytype: typeVoucher == TypeVoucher.SHOP
                              ? BUYTYPE.ecommerce
                              : BUYTYPE.food);
                    },
                  ));
                },
              )),
              backgroundColor: ColorPalette.blue50,
              appBar: MainAppBar(
                  contentAppbar: SizedBox(
                    height: 40,
                    child: TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      controller: state.textEditingController,
                      onSubmitted: (value) {
                        context
                            .read<VoucherManagementBloc>()
                            .add(Search(typeVoucher: typeVoucher));
                      },
                      focusNode: focusNode,
                      onTapOutside: (event) {
                        focusNode.unfocus();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 6),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: ColorPalette.redPrice,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: ColorPalette.redPrice,
                          ),
                        ),
                        prefixIcon: Container(
                          alignment: Alignment.center,
                          height: 18, width: 18,
                          child: icon.SoctripIcon(icon.Icons.searchLg,
                              style: TextStyle(color: ColorPalette.appBarIcon),
                            ),                          
                        ),
                      ),
                    ),
                  ),
                  actionsExtra: [
                    GestureDetector(
                        onTap: () {
                          filter();
                        },
                        child: Stack(
                          children: [
                            package.createSvgFromAsset(AssetHelper.inFilterIcon,
                                height: 24, fit: BoxFit.scaleDown),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: !state.filterModelForVoucherManagement.validate() ? 10 : 0,
                                  width:  !state.filterModelForVoucherManagement.validate()? 10 : 0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(100)),
                                ))
                          ],
                        )),
                    const SizedBox(
                      width: 8,
                    )
                  ]),
              body: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: SizedBox(
                          height: 42, width: double.infinity, child: header()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    state.loadPage && state.voucherResponseModel.totalElement != null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : state.voucherResponseModel.data == null || state.voucherResponseModel.data!.isEmpty 
                        ? noData(context)
                        : ListViewCustom(
                            loading: state.loading,
                            length:
                                state.voucherResponseModel.data?.length ?? 0,
                            builder: (_, index) {
                              return VoucherItemWidget(
                                key: Key(state.voucherResponseModel.data![index].id ?? ""),
                                  voucherDetail:
                                      state.voucherResponseModel.data![index],
                                  onTap: () {
                                  actionMoreVoucher(context, state, index);
                                  },
                                  changePublic: () {
                                    actionChangePublicVoucher(context, state, index);
                                  },
                                  isDeleted: state.tab == TabEnum.DELETED.code,
                                  onTapViewDetail: () => Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) =>
                                      VoucherViewScreen(data: state.voucherResponseModel.data![index],))));
                            },
                            configListView: ConfigListView(
                                maxCrossAxisExtent: 500,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8))
                  ],
                ),
              ),
            );
          },
        ));
  }

  Future<void> actionChangePublicVoucher(
      BuildContext context, VoucherManagementState state, int index) {
    return showCommonBottomSheet(
      context: context,
      shrinkHeight: true,
      useSafeArea: true,
      adjustSoftKeyboard: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return BlocProvider.value(
          value: bloc,
          child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.voucherResponseModel.data![index].isPublic == true
                    ? SharedLocalizations.of(context)!.unpPublic
                    : SharedLocalizations.of(context)!.public,
                style: const TextStyle(
                    color: ColorPalette.gray900,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                state.voucherResponseModel.data![index].isPublic == true
                    ? SharedLocalizations.of(context)!.confirmUnpPublic
                    : SharedLocalizations.of(context)!.confirmPublic,
                style: const TextStyle(
                    color: ColorPalette.gray700,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: SecondaryButton(
                          SharedLocalizations.of(context)!.cancel,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 5,
                        child: PrimaryButton(
                          SharedLocalizations.of(context)!.confirm,
                          onPressed: () {
                            bloc.add(
                                PublicVoucher(
                                    typeVoucher,
                                    id: state.voucherResponseModel.data![index]
                                        .id!));
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
      },
    );
  }

  Future<void> actionMoreVoucher(
      BuildContext context, VoucherManagementState state, int index) {
    return showCommonBottomSheet(
      context: context,
      shrinkHeight: true,
      useSafeArea: true,
      adjustSoftKeyboard: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return BlocProvider.value(
        value: bloc,
        child: Container(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              itemDialog(SharedLocalizations.of(context)!.viewDetail, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VoucherViewScreen(
                          data: state.voucherResponseModel.data![index],
                        )));
              }, icon.Icons.solidFileSearch03),
              itemDialog(
                  SharedLocalizations.of(context)!.delete,
                  () => showDialog<String>(
                        context: context,
                        builder: (BuildContext contextDialog) =>
                            BlocProvider.value(
                                value: bloc,
                                child: AlertDialog(
                                  title: Text(SharedLocalizations.of(context)!
                                      .deleteVoucher),
                                  content: Text(SharedLocalizations.of(context)!
                                      .confirmVoucher),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                          SharedLocalizations.of(context)!
                                              .cancel),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        bloc.add(DeleteVoucher(typeVoucher,
                                                id: state.voucherResponseModel
                                                    .data![index].id!));
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                          SharedLocalizations.of(context)!.ok),
                                    ),
                                  ],
                                )),
                      ),
                  icon.Icons.solidTrash02),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ));
      },
    );
  }
}
Widget noData(BuildContext context) {
  return Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: package.createSvgFromAsset(
                  AssetHelper.emptyIcon,
                  width: 50.0,
                  height: 50.0),
            ),
            SizedBox(
              child: Text(
                SharedLocalizations.of(context)!.noData,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0F1728),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              ),
            )
          ],
        ),
      );
}

Widget itemDialog(String name, Function() onTap, icon.Icon iconData) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: [
            icon.SoctripIcon(iconData),
            const SizedBox(
              width: 16,
            ),
            Text(
              name,
              style: const TextStyle(
                  color: ColorPalette.gray700,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );

  getCustomFormattedDateTime(DateTime givenDateTime, String dateFormat) =>
   DateFormat(dateFormat).format(givenDateTime);


Widget _input(value, hintText, onTap, iconData) {
  TextEditingController controller = TextEditingController(text: value);
  return SizedBox(
    child: TextFormField(
      readOnly: true,
      controller: controller,
      maxLines: 1,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: icon.SoctripIcon(iconData),
        suffixIconConstraints: BoxConstraints(maxHeight: double.infinity),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: ColorPalette.gray300,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorPalette.gray300),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPalette.primary,
            ),
            borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorPalette.gray300),
            borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

Widget itemInVoucherType(
        VoucherType voucherType, bool active, Function() onTap) =>
    GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: getImageUrl(voucherType.icon ?? "",type: ImageType.thumbnail),
                    height: 36,
                    width: 36,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    voucherType.name!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorPalette.gray700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: active
                    ? const icon.SoctripIcon(icon.Icons.check,
                         style: TextStyle(color: ColorPalette.primary),
                      )
                    : Container())
          ],
        ),
      ),
    );
