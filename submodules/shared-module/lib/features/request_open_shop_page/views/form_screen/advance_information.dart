import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import '../../../../constants/color_palette.dart';
import '../../bloc/request_to_open_shop_bloc.dart';
import '../../model/input_variables/advanced_model.dart';
import '../../model/logo_shop.dart';
import '../../widgets/input_field.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;
import 'package:image_picker/image_picker.dart';

class AdvanceInformation extends StatefulWidget {

  const AdvanceInformation({super.key});

  @override
  State<AdvanceInformation> createState() => _AdvanceInformationState();
}

class _AdvanceInformationState extends State<AdvanceInformation> {

  TextEditingController addressNameController = TextEditingController();
  TextEditingController googleUrlController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();


  void _sendDataAdvanceToParent() {
    final advance = AdvancedModel(
        addressAdvance: addressNameController.text,
        googleMapUrl: googleUrlController.text,
        longitude: longitudeController.text,
        latitude: latitudeController.text
    );
    BlocProvider.of<RequestToOpenShopBloc>(context).add(ChangeInputFieldAttachment(advance));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
      builder: (context, state) {
        return state.offlineStore
            ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    color: ColorPalette.baseWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SharedLocalizations.of(context)!.advanceInformation,
                          style: const TextStyle(
                            color: ColorPalette.gray900,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          SharedLocalizations.of(context)!.advanceInfoPrompt,
                          style: const TextStyle(
                            color: ColorPalette.gray900,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: _Time(
                                opening: true,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: _Time(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const WorkingDaysInput(),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              SharedLocalizations.of(context)!.address,
                              style: const TextStyle(
                                color: Color(0xFF344053),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              '*',
                              style: TextStyle(
                                color: Color(0xFFD92C20),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8.0,),
                        Container(
                          width: double.infinity,
                          height: 44,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: addressNameController,
                            onChanged: (_) => _sendDataAdvanceToParent(),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              hintText: SharedLocalizations.of(context)!.enterAddressAdvance,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              SharedLocalizations.of(context)!.googleMapUrl,
                              style: const TextStyle(
                                color: Color(0xFF344053),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              '*',
                              style: TextStyle(
                                color: Color(0xFFD92C20),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8.0,),
                        Container(
                          width: double.infinity,
                          height: 44,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: googleUrlController,
                            onChanged: (_) => _sendDataAdvanceToParent(),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              hintText: SharedLocalizations.of(context)!.enterGoogleMapUrl,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          SharedLocalizations.of(context)!.longitude,
                          style: const TextStyle(
                            color: Color(0xFF344053),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8.0,),
                        Container(
                          width: double.infinity,
                          height: 44,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: longitudeController,
                            onChanged: (_) => _sendDataAdvanceToParent(),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              hintText: SharedLocalizations.of(context)!.enterLongitude,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                              ),
                            ),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          SharedLocalizations.of(context)!.latitude,
                          style: const TextStyle(
                            color: Color(0xFF344053),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8.0,),
                        Container(
                          width: double.infinity,
                          height: 44,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: latitudeController,
                            onChanged: (_) => _sendDataAdvanceToParent(),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              hintText: SharedLocalizations.of(context)!.enterLatitude,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFEAECF0), width: 0.50),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: ColorPalette.primary500, width: 0.50),
                              ),
                            ),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        _Attachments(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({
    this.opening = false,
  });

  final bool opening;

  @override
  Widget build(BuildContext context) {
    RequestToOpenShopBloc requestToOpenShopBloc =
        Provider.of<RequestToOpenShopBloc>(context);
    return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
      bloc: requestToOpenShopBloc,
      buildWhen: (previous, current) =>
          previous.openingTime != current.openingTime ||
          previous.closedTime != current.closedTime,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  opening ? SharedLocalizations.of(context)!.openingTime : SharedLocalizations.of(context)!.closedTime,
                  style: const TextStyle(
                    color: Color(0xFF344053),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xFFD92C20),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
                borderRadius: BorderRadius.circular(8)
              ),
              child: TextButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.all(0),
                  ),
                ),
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime:
                          opening ? state.openingTime : state.closedTime);
                  if (context.mounted) {
                    BlocProvider.of<RequestToOpenShopBloc>(context)
                        .add(ChangeTimes(opening: opening, newTime: newTime));
                  }
                },
                child: ListTile(
                  title: Text(
                    requestToOpenShopBloc.choosingText(opening),
                    style: const TextStyle(
                      color: Color(0xFF667084),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const icon.SoctripIcon(icon.Icons.clock),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Attachments extends StatelessWidget {
  const _Attachments();

  @override
  Widget build(BuildContext context) {
    RequestToOpenShopBloc requestToOpenShopBloc =
        Provider.of<RequestToOpenShopBloc>(context);
    return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
      bloc: requestToOpenShopBloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              SharedLocalizations.of(context)!.attachments,
              style: const TextStyle(
                color: ColorPalette.grey700,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            _LogoTile(),
            ListView(
              shrinkWrap: true,
              children: [
                ...List.generate(
                  state.attachments.numOfAttachments - 1,
                  (index) => Column(
                    children: [
                      const SizedBox(height: 8),
                      _EmptyTile(index: index + 1),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => BlocProvider.of<RequestToOpenShopBloc>(context)
                  .add(const AddAttachment()),
              child: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const icon.SoctripIcon(icon.Icons.plus,
                       style: TextStyle(color: ColorPalette.primary),
                    ),
                    SizedBox(width: 8),
                    Text(
                      SharedLocalizations.of(context)!.addAttachment,
                      style: const TextStyle(
                        color: ColorPalette.primary,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LogoTile extends StatefulWidget {
  @override
  State<_LogoTile> createState() => _LogoTileState();
}

class _LogoTileState extends State<_LogoTile> {
  final picker = ImagePicker();


  Future getImage(BuildContext context) async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 1, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(() {
        if (xfilePick.isNotEmpty &&
            (xfilePick.length < 2)) {
          context.read<RequestToOpenShopBloc>().add(UploadLogoShop(File(xfilePick[0].path)));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    RequestToOpenShopBloc requestToOpenShopBloc =
        Provider.of<RequestToOpenShopBloc>(context);
    return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
      bloc: requestToOpenShopBloc,
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height / 13,
          padding: const EdgeInsets.only(right: 6),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                width: MediaQuery.of(context).size.width / 2.5,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: Color(0xFFEBEDEF),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    SharedLocalizations.of(context)!.logoFile,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: ColorPalette.baseDark,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 0.5, color: Color(0xFFCFD4DC)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    state.logoShop?.originalName != null
                        ? state.logoShop!.originalName! : SharedLocalizations.of(context)!.uploadFile,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: ColorPalette.baseDark,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  getImage(context);
                },
                child: const icon.SoctripIcon(icon.Icons.share01, style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EmptyTile extends StatefulWidget {
  const _EmptyTile({required this.index});
  final int index;


  @override
  State<_EmptyTile> createState() => _EmptyTileState();
}

class _EmptyTileState extends State<_EmptyTile> {
  final picker = ImagePicker();

  Future getListImages(BuildContext context, int index) async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 1, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
          () {
        if (xfilePick.isNotEmpty &&
            (xfilePick.length < 2)) {
          List<File> data = [];
          for (var i = 0; i < xfilePick.length; i++) {
            data.add(File(xfilePick[i].path));
          }
          context.read<RequestToOpenShopBloc>().add(UploadAttachments(data,index));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    RequestToOpenShopBloc requestToOpenShopBloc =
    Provider.of<RequestToOpenShopBloc>(context);
    return BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
        bloc: requestToOpenShopBloc,
        builder: (context, state)
    {
      final TextEditingController descriptionController = TextEditingController();

      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height / 13,
        padding: const EdgeInsets.only(right: 6),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12),
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2.5,
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                color: Color(0xFFEBEDEF),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: SharedLocalizations.of(context)!.enterAttachmentFile,
                    hintStyle: const TextStyle(
                      color: ColorPalette.baseDark,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF98A2B3),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 0.5, color: Color(0xFFCFD4DC)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  SharedLocalizations.of(context)!.uploadFile,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: ColorPalette.baseDark,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                  BlocProvider.of<RequestToOpenShopBloc>(context)
                      .add(DeleteAttachment(index: widget.index));
                  },
              child: const icon.SoctripIcon(icon.Icons.trash01, style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(width: 12),
            InkWell(
              onTap: () {
                getListImages(context,widget.index);
              },
              child: const icon.SoctripIcon(icon.Icons.share01, style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      );
    },
    );
  }
}

class _UploadedTile extends StatefulWidget {
  const _UploadedTile({required this.index});
  final int index;

  @override
  State<_UploadedTile> createState() => _UploadedTileState();
}

class _UploadedTileState extends State<_UploadedTile> {
  final picker = ImagePicker();

  Future getListImages(BuildContext context) async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 1, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
          () {
        if (xfilePick.isNotEmpty &&
            (xfilePick.length < 2)) {
          List<File> data = [];
          for (var i = 0; i < xfilePick.length; i++) {
            data.add(File(xfilePick[i].path));
          }
          // context.read<RequestToOpenShopBloc>().add(UploadAttachments(data));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    RequestToOpenShopBloc requestToOpenShopBloc =
        Provider.of<RequestToOpenShopBloc>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 13,
      padding: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: ColorPalette.baseWhite,
        border: Border.all(width: 0.5, color: const Color(0xFFCFD4DC)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
        bloc: requestToOpenShopBloc,
        builder: (context, state) {
          return Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                width: MediaQuery.of(context).size.width / 2.5,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: ColorPalette.grey200,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    requestToOpenShopBloc.uploadedTile(widget.index)?.description ??
                        "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: ColorPalette.baseDark,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 0.5, color: Color(0xFFCFD4DC)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    requestToOpenShopBloc.uploadedTile(widget.index)?.original_name ??
                        "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: ColorPalette.baseDark,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () { BlocProvider.of<RequestToOpenShopBloc>(context)
                    .add(DeleteAttachment(index: widget.index));
                  },
                child: const icon.SoctripIcon(icon.Icons.trash01, style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  getListImages(context);
                },
                child: const icon.SoctripIcon(icon.Icons.share01, style: TextStyle(fontSize: 18)),
              ),
            ],
          );
        },
      ),
    );
  }
}
