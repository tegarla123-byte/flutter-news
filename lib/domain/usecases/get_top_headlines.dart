import 'package:flutter_news/domain/entities/article.dart';
import 'package:flutter_news/domain/repositories/news_repository.dart';

class GetTopHeadlines {
  final NewsRepository _repo;

  GetTopHeadlines(this._repo);

  Future<(List<Article> items, int totalResults)> call({
    required String country,
    required int page,
    required int pageSize,
  }) {
    return _repo.getTopHeadlines(
      country: country,
      page: page,
      pageSize: pageSize,
    );
  }
}
