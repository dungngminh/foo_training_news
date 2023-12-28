import 'package:json_annotation/json_annotation.dart';
import 'package:newsapp/data/remote/response/source_response.dart';

part 'article_response.g.dart';

@JsonSerializable(createToJson: false)
class ArticleResponse {
  ArticleResponse({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  final SourceResponse? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  @override
  String toString() {
    return 'ArticleResponse(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }
}
