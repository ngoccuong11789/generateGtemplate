import 'package:flutter/material.dart';

class TabScreenDemo extends StatelessWidget {
  const TabScreenDemo({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Text(title),
        ],
      )
    );
  }
}
