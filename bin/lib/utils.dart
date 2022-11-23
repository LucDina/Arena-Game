import 'dart:convert';

abstract class Json {
  static String stringify(Map<String, dynamic> map) => json.encode(map);

  static Map<String, dynamic> parse(String string) => json.decode(string);

  static String shema(Map<String, dynamic> map, {bool readable = false}) {
    return JsonEncoder.withIndent(!readable ? null : "  ").convert(map);
  }
}

num inPurcent(num value, num maxValue) => (value / maxValue) * 100;
