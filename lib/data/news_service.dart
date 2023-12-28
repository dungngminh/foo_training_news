import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/data/response/article_response.dart';

class NewsService {
  final client = Client();

  Future<List<ArticleResponse>> getArticles({String country = 'us'}) async {
    final response = await client.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=${Constant.apiKey}',
      ),
    );
    if (response.statusCode != 200) throw Exception('Failed to get articles');
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final rawArticles = decodedResponse['articles'] as List;
    return rawArticles
        .map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
