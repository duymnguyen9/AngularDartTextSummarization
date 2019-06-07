class TextResult {
  final String summary;
  final List<dynamic> keywords;

  TextResult({this.summary, this.keywords});

  factory TextResult.fromJson(Map<String, dynamic> json){
    return TextResult(
      summary: json['summary'],
      keywords: json['keyword'],

    );
  }
}
