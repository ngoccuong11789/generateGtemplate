import 'package:flutter/material.dart';

class StripeCardScreen extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;

  const StripeCardScreen({
    Key? key,
    this.children = const [],
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (padding != null)
              Padding(
                padding: padding!,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
              )
            else
              ...children,
          ],
        ),
      ),
    );
  }
}
