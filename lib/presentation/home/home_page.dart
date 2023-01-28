import 'package:flutter/material.dart';
import 'package:newsapp/presentation/detail/detail_page.dart';
import 'package:newsapp/presentation/home/home_provider.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(
        context.read<NewsRepostiory>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'News',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.orange,
                  ),
                  const Text(
                    'Headlines',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<HomeProvider>(
                builder: (context, provider, child) {
                  final loadingStatus = provider.loadingStatus;
                  final articles = provider.articles;

                  if (loadingStatus.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (loadingStatus.isError) {
                    return const Center(
                      child: Text('Lỗi rồi huhu'),
                    );
                  }
                  if (articles.isEmpty) {
                    return const Center(
                      child: Text('Không có gì'),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: articles.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return SizedBox(
                        height: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (_) =>
                                        DetailPage(article: article),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: article.toString(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: Image.network(
                                        article.urlToImage ?? '',
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.error);
                                        },
                                      ).image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 150,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              article.title ?? 'No information',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
