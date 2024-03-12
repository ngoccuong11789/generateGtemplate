import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import '../bloc/request_to_open_shop_bloc.dart';
import 'bottom_action_bar.dart';
import 'package:provider/provider.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class _Title extends StatelessWidget {
  const _Title({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF101828),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 0.09,
        ),
      ),
      trailing: GestureDetector(
        child: const icon.SoctripIcon(icon.Icons.xClose),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}


class _DragBar extends StatelessWidget {
  const _DragBar();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 32,
        height: 4,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: ColorPalette.gray300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class WorkingDaysInput extends StatelessWidget {
  const WorkingDaysInput({
    super.key,
  });

  bool containsTrue(List<bool> list) {
    for (var element in list) {
      if (element == true) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    RequestToOpenShopBloc requestToOpenShopBloc =
        Provider.of<RequestToOpenShopBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          SharedLocalizations.of(context)!.workingDays,
          style: const TextStyle(
            color: Color(0xFF344053),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Color(0xFFCFD4DC)),
            borderRadius: BorderRadius.circular(8)
          ),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: ColorPalette.baseWhite,
                context: context,
                builder: (context) =>
                    BlocBuilder<RequestToOpenShopBloc, RequestToOpenShopState>(
                  bloc: requestToOpenShopBloc,
                  builder: (context, state) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          const _DragBar(),
                          const SizedBox(height: 8),
                          _Title(title: SharedLocalizations.of(context)!.workingDays),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                ...List.generate(
                                  7,
                                  (index) => Row(
                                    children: [
                                      const SizedBox(width: 8),
                                      Checkbox(
                                        side: const BorderSide(width: 0.5),
                                        activeColor: ColorPalette.bluePrimary,
                                        value:
                                            state.workingDays.indexList[index],
                                        onChanged: (newValue) =>
                                            requestToOpenShopBloc.add(
                                                ChangWorkingDays(index: index)),
                                      ),
                                      GestureDetector(
                                        onTap: () => requestToOpenShopBloc.add(
                                            ChangWorkingDays(index: index)),
                                        child: Text(
                                          state.workingDays.days[index],
                                          style: const TextStyle(
                                            color: Color(0xFF344053),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          BottomActionBar(
                              text: SharedLocalizations.of(context)!.save,
                              onPressed: () => Navigator.pop(context),
                              controller:
                                  containsTrue(state.workingDays.indexList)),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<RequestToOpenShopBloc,
                      RequestToOpenShopState>(
                    bloc: requestToOpenShopBloc,
                    builder: (context, state) {
                      return Text(
                        containsTrue(state.workingDays.indexList)
                            ? requestToOpenShopBloc.getTitleWorkingDays()
                            : SharedLocalizations.of(context)!.selectDays,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF727781),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                const icon.SoctripIcon(icon.Icons.chevronDown),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

