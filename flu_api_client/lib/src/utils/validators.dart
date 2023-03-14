import 'dart:convert';

bool isValidJson(dynamic value) {
  try {
    final Map<String, dynamic> decodedJSON =
        json.decode(value) as Map<String, dynamic>;
    return true;
  } on FormatException catch (e) {
    return false;
  }
}
