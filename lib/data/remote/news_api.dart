import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/data/remote/response/article_response.dart';

class ServerException implements Exception {}

class NewsApi {
  NewsApi({
    required String baseUrl,
    required String apiKey,
    required http.Client client,
  })  : _apiKey = apiKey,
        _baseUrl = baseUrl,
        _client = client;

  final String _baseUrl;
  final String _apiKey;

  final http.Client _client;

  Future<List<ArticleResponse>> getTopHeadlineByCountry(String country) async {
    final uri = Uri.https(_baseUrl, '/v2/top-headlines', {
      'country': country,
      'apiKey': _apiKey,
    });
    final response = await _client.get(uri);
    if (response.statusCode != 200) throw ServerException();
    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    final articleBody = jsonBody['articles'] as List;
    return articleBody
        .map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
