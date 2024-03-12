import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/features/buy_now/bloc/variants_bloc.dart';
import 'package:shared_module/localization/shared_localizations.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class Quantity extends StatefulWidget {
  final num? quantity;
  const Quantity({super.key, this.quantity});

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  late TextEditingController _controller;
  late int _quantity;
  late num _maxStock;

  @override
  void initState() {
    (widget.quantity == null) ? (_quantity = 1) : (_quantity = widget.quantity!.toInt());
    _controller = TextEditingController(text: _quantity.toString());
    super.initState();
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Allow empty input
    }

    final parsedValue = int.tryParse(value);
    if (parsedValue == null || parsedValue < 0 || parsedValue > _maxStock) {
      return 'Please enter a number within stock allow';
    }

    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _maxStock = BlocProvider.of<VariantsBloc>(context, listen: true)
            .state
            .stocks
            ?.quantity ??
        BlocProvider.of<VariantsBloc>(context).state.product?.quantity ??
        0;

    Widget buttonCount(Widget widgetIcon, Function()? onTap){
      return Stack(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                shadows: const [
                  BoxShadow(
                    color: ColorPalette.gray300,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ]
            ),
          ),
          Container(
            height: 32,
            width: 32,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              color: Colors.white, // Set the button background color here
            ),
            child: IconButton(
              splashColor: ColorPalette.baseWhite,
              icon: widgetIcon,
              padding: EdgeInsets.zero,
              onPressed: onTap,
            ),
          ),
        ],
      );
    }

    Widget countQuantity(){
      return  Row(
        children: [
          Container(
            height: 36,
            padding: EdgeInsets.zero,
            decoration: ShapeDecoration(
              color: ColorPalette.homeBackground,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFEAECF0)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttonCount(
                    const icon.SoctripIcon(icon.Icons.minus, style: TextStyle(fontSize: 16)),
                      () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                      _controller.text = _quantity.toString();
                    });
                    BlocProvider.of<VariantsBloc>(context)
                        .add(SetBuyQuantityEvent(_quantity));
                  },
                ),
                Container(
                    width: 36.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: _validateInput,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.all(0)
                      ),
                      onTapOutside: (_) {
                        if (_controller.text.isNotEmpty) {
                          final parsedValue =
                          int.tryParse(_controller.text);

                          if (parsedValue != null &&
                              parsedValue >= 0 &&
                              parsedValue <= _maxStock) {
                            _quantity = parsedValue;
                          }
                          _controller.text = _quantity.toString();
                          BlocProvider.of<VariantsBloc>(context)
                              .add(SetBuyQuantityEvent(_quantity));
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: _controller,
                      style: const TextStyle(
                        color: Color(0xFF667085),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                buttonCount(
                  const icon.SoctripIcon(icon.Icons.plus, style: TextStyle(fontSize: 16)),
                      () {
                    setState(() {
                      if (_quantity < _maxStock) _quantity++;
                      _controller.text = _quantity.toString();
                      BlocProvider.of<VariantsBloc>(context)
                          .add(SetBuyQuantityEvent(_quantity));
                    });
                  }
                )
              ],
            ),
          ),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                SharedLocalizations.of(context)!.quantity,
                style: const TextStyle(
                  color: Color(0xFF344053),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.43,
                ),
              ),
              Text(
                SharedLocalizations.of(context)!.availableProducts(_maxStock),
                style: const TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          countQuantity()
        ],
      ),
    );
  }
}
