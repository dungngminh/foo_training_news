import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/repository/news_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleState()) {
    on<GetDataEvent>(_onGetDataEvent);
    on<RequestRefreshDataEvent>(_onRequestRefreshData);
    add(GetDataEvent());
  }

  final articleRepository = NewsRepository();

  Future<void> _onGetDataEvent(
    GetDataEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final articles = await articleRepository.getArticles();
      log(articles.toString());
      emit(state.copyWith(articles: articles, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onRequestRefreshData(
    RequestRefreshDataEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final articles = await articleRepository.getArticles();
      log(articles.toString());
      emit(state.copyWith(articles: articles, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
