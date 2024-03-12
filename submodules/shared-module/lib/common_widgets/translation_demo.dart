import 'package:flutter/cupertino.dart';
import 'package:shared_module/localization/localizations.dart';

class TranslationDemo extends StatefulWidget{

  const TranslationDemo({super.key});

  @override
  State<StatefulWidget> createState()=> _TranslationDemoState();
}

class _TranslationDemoState extends State<TranslationDemo>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(SharedLocalizations.of(context)!.helloUser("Alice")),
        Text(SharedLocalizations.of(context)!.userHaveNApple("Bob", 0)),
        Text(SharedLocalizations.of(context)!.userHaveNApple("John", 1)),
        Text(SharedLocalizations.of(context)!.userHaveNApple("Thịnh", 5)),
        Text(SharedLocalizations.of(context)!.heOrSheDidIt("male")),
        Text(SharedLocalizations.of(context)!.heOrSheDidIt("female")),
        Text(SharedLocalizations.of(context)!.heOrSheDidIt("unknown")),
      ],
    );
  }

}