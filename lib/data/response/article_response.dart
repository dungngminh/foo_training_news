import 'package:newsapp/data/response/source_response.dart';

class ArticleResponse {
  ArticleResponse({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      source: SourceResponse.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: (json['publishedAt'] as String?) == null
          ? null
          : DateTime.tryParse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );
  }

  final SourceResponse source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
}
