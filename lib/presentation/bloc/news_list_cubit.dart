import 'package:flutter_news/domain/usecases/get_top_headlines.dart';
import 'package:flutter_news/domain/usecases/toggle_bookmark.dart';
import 'package:flutter_news/presentation/bloc/news_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListCubit extends Cubit<NewsListState> {
  final GetTopHeadlines _getTopHeadlines;
  final ToggleBookmark _toggleBookmark;

  NewsListCubit(this._getTopHeadlines, this._toggleBookmark)
    : super(NewsListState.initial());

  static const int _pageSize = 20;
  static const String _country = "us";

  Future<void> _fetch({required int page, required bool append}) async {
    try {
      emit(state.copyWith(status: LoadStatus.loading, errorMessage: null));

      final result = await _getTopHeadlines(
        country: _country,
        page: page,
        pageSize: _pageSize,
      );

      final newItems = append ? [...state.items, ...result.$1] : result.$1;
      final total = result.$2;

      emit(
        state.copyWith(
          status: LoadStatus.success,
          items: newItems,
          page: page,
          totalResults: total,
          hasReachedEnd: newItems.length >= total || result.$1.isEmpty,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: LoadStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> refresh() async {
    emit(
      state.copyWith(
        status: LoadStatus.loading,
        items: [],
        page: 1,
        totalResults: 0,
        hasReachedEnd: false,
        errorMessage: null,
      ),
    );
    await _fetch(page: 1, append: false);
  }

  Future<void> loadMore() async {
    if (state.hasReachedEnd || state.status == LoadStatus.loading) {
      return;
    }
    await _fetch(page: state.page + 1, append: true);
  }

  Future<void> onToggleBookmark(String url) async {
    final isNowBookmarked = await _toggleBookmark(url);
    final updated = state.items
        .map(
          (a) => a.url == url ? a.copyWith(isBookmarked: isNowBookmarked) : a,
        )
        .toList();
    emit(state.copyWith(items: updated));
  }
}
