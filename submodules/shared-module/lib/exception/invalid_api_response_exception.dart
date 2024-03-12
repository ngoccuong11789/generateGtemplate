import 'package:shared_module/exception/soctrip_api_exception.dart';

class InvalidApiResponseException extends SoctripApiException {
  InvalidApiResponseException([String expectation = ""])
      : super(
            message:
                "API server response an invalid response.${expectation.isEmpty ? "" : " $expectation"}");
}
