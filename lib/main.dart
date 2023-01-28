import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/data/remote/news_api.dart';
import 'package:newsapp/presentation/home/home_page.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:provider/provider.dart';

void main() {
  const baseUrl = String.fromEnvironment('BASE_URL');
  const apiKey = String.fromEnvironment('API_KEY');

  final client = http.Client();

  final newsApi = NewsApi(
    apiKey: apiKey,
    baseUrl: baseUrl,
    client: client,
  );

  final newsRepository = NewsRepostiory(newsApi);

  runApp(
    MyApp(
      newsRepostiory: newsRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.newsRepostiory});

  final NewsRepostiory newsRepostiory;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: newsRepostiory,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
