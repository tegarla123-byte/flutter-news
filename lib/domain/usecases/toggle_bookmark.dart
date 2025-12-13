import 'package:flutter_news/domain/repositories/news_repository.dart';

class ToggleBookmark {
  final NewsRepository _repo;

  ToggleBookmark(this._repo);

  Future<bool> call(String url) => _repo.toggleBookmark(url);
}
