import 'package:flutter/widgets.dart';
import 'package:soctrip_super_app/super_app.dart';

import 'injection.dart';

void main() async {
  configureDependencies();
  runApp(const SuperApp());
}
