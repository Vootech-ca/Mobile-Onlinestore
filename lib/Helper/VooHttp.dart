import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> postHTTP(
    {required String url,
    required Map<String, dynamic> body,
    required Map<String, dynamic> header}) async {
  var response = await http.post(
    Uri.parse(url),
    body: body,
  );

  return jsonDecode(response.body);
}

Future<Map<String, dynamic>> getHTTP(
    {required String url, required Map<String, String> headers}) async {
  var response = await http.get(Uri.parse(url), headers: headers);
  // print(response);

  return jsonDecode(response.body);
}
