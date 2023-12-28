import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/articles/bloc/article_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleBloc(),
      child: const ArticlesView(),
    );
  }
}

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.error.isNotEmpty) {
            return Center(
              child: Text('Error, please try again ${state.error}'),
            );
          }
          if (state.articles.isEmpty) {
            return const Center(
              child: Text('No articles found'),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ArticleBloc>().add(RequestRefreshDataEvent());
            },
            child: ListView.separated(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return Container(
                  height: 130,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 130,
                        child: Image.network(
                          article.urlToImage ??
                              'https://avatars.githubusercontent.com/u/63831488?v=4',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title ?? 'No title',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                article.description ?? 'No description',
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
