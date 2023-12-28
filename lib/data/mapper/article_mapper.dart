import 'package:newsapp/data/response/article_response.dart';
import 'package:newsapp/data/response/source_response.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/models/source.dart';

Article toArticle(ArticleResponse response) {
  return Article(
    source: toSource(response.source),
    author: response.author,
    title: response.title,
    description: response.description,
    url: response.url,
    urlToImage: response.urlToImage,
    publishedAt: response.publishedAt,
    content: response.content,
  );
}

Source toSource(SourceResponse response) {
  return Source(
    id: response.id,
    name: response.name,
  );
}
