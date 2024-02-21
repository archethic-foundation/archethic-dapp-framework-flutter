import 'dart:convert';
import 'package:archive/archive.dart';

mixin RouterMixin {
  String encodeQueryParameter(Object parameter) {
    final parameterJson = jsonEncode(parameter);
    final parameterEncoded = Uri.encodeComponent(parameterJson);
    final compressedParameter = GZipEncoder().encode(parameterEncoded);
    return base64Url.encode(compressedParameter!);
  }

  String decodeQueryParameter(String encodedParameter) {
    final compressedParameter = base64Url.decode(encodedParameter);
    final parameterEncoded = GZipDecoder().decodeBytes(compressedParameter);
    final parameterJson = utf8.decode(parameterEncoded);
    final parameter = jsonDecode(parameterJson);
    return parameter;
  }
}
