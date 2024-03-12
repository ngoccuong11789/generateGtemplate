
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_gate/const/assets.dart';
import 'package:payment_gate/const/strings.dart';
import 'package:payment_gate/localization/localizations.dart';
import 'package:payment_gate/enum/payment_method.dart';
import 'package:payment_gate/localization/payment_gate_translateable.dart';
import 'package:payment_gate/payment_gate.dart';
import 'package:payment_gate/utils/localization_interceptor.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;


class PaymentMethodSelector extends StatefulWidget {

  final PaymentTranslatableInterceptor? translatableInterceptor;

  final ValueChanged<PaymentMethod?>? onChanged;
  
  final Set<PaymentMethod>? disabledMethod;

  const PaymentMethodSelector(
      {super.key, this.onChanged, this.translatableInterceptor, this.disabledMethod});

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  PaymentMethod? selectedMethod;
  PaymentGateTranslatable? translatableOf(BuildContext context) {
    final localization = AppLocalizations.of(context);
    if (widget.translatableInterceptor == null || localization == null) {
      return localization;
    }
    return widget.translatableInterceptor!(localization);
  }

  @override
  void didUpdateWidget(covariant PaymentMethodSelector oldWidget) {
    if (widget.disabledMethod != null &&
        selectedMethod != null &&
        widget.disabledMethod!.contains(selectedMethod)) {
      _select(null);
    }
    super.didUpdateWidget(oldWidget);
  }
  Widget _getIcon(PaymentMethod method) {
    const icons = {
      PaymentMethod.cashOnDelivery: icon.SoctripIcon(icon.Icons.coinsHand),
      PaymentMethod.bankTransfer: icon.SoctripIcon(icon.Icons.bankNote03),
      PaymentMethod.creditCard: icon.SoctripIcon(icon.Icons.creditCard02),
      PaymentMethod.crypto: icon.SoctripIcon(icon.Icons.currencyBitcoinCircle)
    };
    return icons[method] ?? const icon.SoctripIcon(icon.Icons.bankNote02);
  }

  String _getTitle(PaymentMethod method, PaymentGateTranslatable translatable) {
    switch (method) {
      case PaymentMethod.cashOnDelivery:
        return translatable.cashOnDelivery;
      case PaymentMethod.bankTransfer:
        return translatable.bankTransfer;
      case PaymentMethod.creditCard:
        return translatable.creditCard;
      case PaymentMethod.crypto:
        return translatable.crypto;
    }
  }

  Widget _buildCheckBox(bool isCheck, ValueChanged<bool?>? onChanged) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Transform.scale(
        scale: 1,
        child: Checkbox(
            shape: const CircleBorder(),
            side: MaterialStateBorderSide.resolveWith(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const BorderSide(width: 1, color: Color(0xFF1570EF));
                }
                return const BorderSide(width: 1, color: Color(0xFFD0D5DD));
              },
            ),
            activeColor: const Color(0xFF1570EF),
            checkColor: Colors.white,
            value: isCheck,
            onChanged: onChanged),
      ),
    );
  }

  Widget _buildItemTitle(PaymentMethod method, PaymentGateTranslatable translatable) {
    final title = Text(
      _getTitle(method, translatable),
      style: const TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF344054)),
    );
    if (method == PaymentMethod.creditCard) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title,
          SvgPicture.asset(Assets.creditCardIcons,
              package: Strings.packageName),
        ],
      );
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    final translatable = translatableOf(context)!;

    final title = Text(
      translatable.paymentMethod,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF344054)),
    );

    var enabledMethods = PaymentGateApp.config.availableMethods;
    if (widget.disabledMethod != null) {
      enabledMethods =
          enabledMethods.where((e) => !widget.disabledMethod!.contains(e));
    }

    final listTiles = enabledMethods.map((method) {
      final isSelected = method == selectedMethod;
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: InkWell(
          onTap: () {
            _select(method);
          },
          child: Container(
            decoration: ShapeDecoration(
                color: isSelected ? const Color(0xFFEFF8FF) : Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.5,
                      color: isSelected
                          ? const Color(0xFF1570EF)
                          : const Color(0xFFEAECF0)),
                  borderRadius: BorderRadius.circular(8),
                )
            ),
            child: ListTile(
              title: _buildItemTitle(method, translatable),
              leading: _getIcon(method),
              trailing: _buildCheckBox(isSelected, (newValue) {
                if (isSelected) {
                  if (newValue != true) {
                    _select(null);
                  }
                } else {
                  _select(method);
                }
              }),
            ),
          ),
        ),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        ...listTiles
      ],
    );
  }

  void _select(PaymentMethod? method) {
    setState(() {
      selectedMethod = method;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(method);
    }
  }
}