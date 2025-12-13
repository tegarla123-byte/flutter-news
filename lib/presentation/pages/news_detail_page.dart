import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/article.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.sourceName.isEmpty ? 'Detail' : article.sourceName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(article.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          if (article.publishedAt != null)
            Text(
              article.publishedAt!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const SizedBox(height: 12),
          if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(article.imageUrl!, fit: BoxFit.cover),
            ),
          const SizedBox(height: 12),
          Text(article.description),
          const SizedBox(height: 12),
          Text(article.url, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
