import 'package:newsapp/data/mapper/article_mapper.dart';
import 'package:newsapp/data/news_service.dart';
import 'package:newsapp/models/article.dart';

class NewsRepository {
  final newsService = NewsService();

  Future<List<Article>> getArticles({String country = 'us'}) async {
    final article = await newsService.getArticles(country: country);
    return article.map(toArticle).toList();
  }
}
