import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/repository/news_repository.dart';

enum LoadingStatus {
  initial,
  loading,
  done,
  error;

  bool get isInitial => this == LoadingStatus.initial;
  bool get isLoading => this == LoadingStatus.loading;
  bool get isDone => this == LoadingStatus.done;
  bool get isError => this == LoadingStatus.error;
}

class HomeProvider extends ChangeNotifier {
  HomeProvider(this._newsRepostiory) {
    getTopHeadlineByCountry();
  }

  final NewsRepostiory _newsRepostiory;

  List<Article> articles = [];

  LoadingStatus loadingStatus = LoadingStatus.initial;

  String country = 'us';

  Future<void> getTopHeadlineByCountry() async {
    try {
      loadingStatus = LoadingStatus.loading;
      notifyListeners();
      final fetchedArticles =
          await _newsRepostiory.getTopHeadlineByCountry(country);
      articles = fetchedArticles;
      loadingStatus = LoadingStatus.done;
      notifyListeners();
    } catch (e) {
      loadingStatus = LoadingStatus.error;
      notifyListeners();
    }
  }
}
