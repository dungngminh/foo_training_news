part of 'article_bloc.dart';

abstract class ArticleEvent {}

class GetDataEvent extends ArticleEvent {}

class RequestRefreshDataEvent extends ArticleEvent {}
