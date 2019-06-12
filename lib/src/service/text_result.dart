class TextResult {
  final String summary;
  final List<dynamic> keywords;
  final int wordCountOriginal;
  final int wordCountSummary;

  TextResult({this.summary, this.keywords, this.wordCountOriginal, this.wordCountSummary});

  factory TextResult.fromJson(Map<String, dynamic> json){
    return TextResult(
      summary: json['summary'],
      keywords: json['keyword'],
      wordCountOriginal: json['wordcountoriginal'],
      wordCountSummary: json['wordcountsummary'],
    );
  }
}
