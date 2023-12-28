part of 'article_bloc.dart';

class ArticleState {
  ArticleState({
    this.articles = const <Article>[],
    this.isLoading = false,
    this.error = '',
  });

  final List<Article> articles;
  final bool isLoading;
  final String error;

  ArticleState copyWith({
    List<Article>? articles,
    bool? isLoading,
    String? error,
  }) {
    return ArticleState(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
