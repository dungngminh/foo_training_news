import 'package:newsapp/data/remote/news_api.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/models/source.dart';

class NewsRepostiory {
  NewsRepostiory(this._newsApi);

  final NewsApi _newsApi;

  Future<List<Article>> getTopHeadlineByCountry(String country) async {
    final aritcleResponse = await _newsApi.getTopHeadlineByCountry(country);
    return aritcleResponse.map(
      (e) {
        return Article(
          source: Source(
            id: e.source?.id,
            name: e.source?.name,
          ),
          title: e.title,
          author: e.author,
          content: e.content,
          description: e.description,
          publishedAt: e.publishedAt,
          url: e.url,
          urlToImage: e.urlToImage,
        );
      },
    ).toList();
  }
}
