import 'package:flutter_news/domain/entities/article.dart';

abstract class NewsRepository {
  Future<(List<Article> items, int totalResults)> getTopHeadlines({
    required String country,
    required int page,
    required int pageSize,
  });

  Future<Set<String>> getBookmarkedUrls();

  Future<bool> toggleBookmark(String url);
}
