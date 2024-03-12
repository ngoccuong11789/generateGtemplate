import 'package:shared_module/exception/soctrip_exeception.dart';

class SoctripApiException extends SoctripException {
  final int? errorCode;

  SoctripApiException({this.errorCode, super.message = ""});
}
