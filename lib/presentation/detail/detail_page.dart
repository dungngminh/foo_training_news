import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title ?? 'No info')),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: article.toString(),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      article.urlToImage ?? 'No Info',
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ).image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              article.title ?? 'No title',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 30),
            Text(
              article.publishedAt.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              article.content ?? 'No info',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
