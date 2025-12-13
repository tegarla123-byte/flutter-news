import 'package:flutter_news/data/sources/news_api.dart';
import 'package:flutter_news/domain/entities/article.dart';
import 'package:flutter_news/domain/repositories/news_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApi _api;
  static const _bookmarkKey = 'bookmarks_urls';

  NewsRepositoryImpl(this._api);

  @override
  Future<Set<String>> getBookmarkedUrls() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_bookmarkKey) ?? <String>[];
    return list.toSet();
  }

  @override
  Future<(List<Article>, int)> getTopHeadlines({
    required String country,
    required int page,
    required int pageSize,
  }) async {
    final bookmarked = await getBookmarkedUrls();

    final res = await _api.getTopHeadlines(
      country: country,
      page: page,
      pageSize: pageSize,
    );

    final total = res.totalResults ?? 0;
    final items = (res.articles ?? [])
        .where((e) => (e.url ?? '').isNotEmpty)
        .map((e) => e.toEntity(isBookmarked: bookmarked.contains(e.url)))
        .toList();

    return (items, total);
  }

  @override
  Future<bool> toggleBookmark(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final list = (prefs.getStringList(_bookmarkKey) ?? <String>[]).toSet();

    if (list.contains(url)) {
      list.remove(url);
      await prefs.setStringList(_bookmarkKey, list.toList());
      return false;
    } else {
      list.add(url);
      await prefs.setStringList(_bookmarkKey, list.toList());
      return true;
    }
  }
}
