import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.article,
    required this.onTap,
    required this.onBookmark,
  });

  final Article article;
  final VoidCallback onTap;
  final VoidCallback onBookmark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        article.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: onBookmark,
        icon: Icon(
          article.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        ),
      ),
    );
  }
}
