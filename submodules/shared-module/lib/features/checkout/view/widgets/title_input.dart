import 'package:flutter/cupertino.dart';

class TitleInput extends StatefulWidget {
  final String title;
  final bool? isHint;
  const TitleInput({super.key, required this.title, this.isHint});

  @override
  State<TitleInput> createState() => _TitleInputState();
}

class _TitleInputState extends State<TitleInput> {
  late bool isHint = false;
  late double paddingLeft;

  @override
  void initState() {
    isHint = widget.isHint ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Color(0xFF344053),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
          const SizedBox(width: 4),
          !isHint ? const Text(
            '*',
            style: TextStyle(
              color: Color(0xFFD92C20),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ) : Container(),
        ],
      ),
    );
  }
}

