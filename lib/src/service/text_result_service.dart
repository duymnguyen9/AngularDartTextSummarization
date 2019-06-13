import 'text_result.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class TextResultService{
  Future<TextResult> createPost(String url, String submittedText, int wordCount, int summaryRatio) async {
    var body = json.encode({"content": submittedText, "wordcount": wordCount, "summaryratio":summaryRatio});
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

      //DO SOMETHING WITH THIS
      return TextResult.fromJson(json.decode(response.body));
    });
  }

  int validatingInput(String submittedText){
    if(submittedText.length <=5){
      return 0;
    }
    String regex_match = r'([\.\?\!][\u2018\u2019\u201c\u201d\)\]]*\s*(?<!\w\.\w.)(?<![A-Z][a-z][a-z]\.)(?<![A-Z][a-z]\.)(?<![A-Z]\.)\s+)';
    List<String> rawlistString = submittedText.split(RegExp(regex_match));
    List<String> cleanedListString = [];
    for (var i in rawlistString){
      if(i.length > 15){
        cleanedListString.add(i);
      }
    }
    print("Numbers of input sentences: " + cleanedListString.length.toString());
    if(cleanedListString.length>10){
      return 2;
    }
    else {
      return 1;
    }

  }

}