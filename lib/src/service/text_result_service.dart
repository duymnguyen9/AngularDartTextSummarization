import 'text_result.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class TextResultService{
  Future<TextResult> createPost(String url, String submittedText) async {
    var body = json.encode({"content": submittedText});
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return http.post(url,
        headers: requestHeaders,
        body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      print("${response.body}");

      //DO SOMETHING WITH THIS
      return TextResult.fromJson(json.decode(response.body));
    });
  }
}