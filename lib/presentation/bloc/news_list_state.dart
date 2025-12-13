import 'package:equatable/equatable.dart';
import 'package:flutter_news/domain/entities/article.dart';

enum LoadStatus { initial, loading, success, failure }

class NewsListState extends Equatable {
  final LoadStatus status;
  final List<Article> items;
  final int page;
  final int totalResults;
  final bool hasReachedEnd;
  final String? errorMessage;

  const NewsListState({
    required this.status,
    required this.items,
    required this.page,
    required this.totalResults,
    required this.hasReachedEnd,
    required this.errorMessage,
  });

  factory NewsListState.initial() => const NewsListState(
    status: LoadStatus.initial,
    items: [],
    page: 1,
    totalResults: 0,
    hasReachedEnd: false,
    errorMessage: null,
  );

  NewsListState copyWith({
    LoadStatus? status,
    List<Article>? items,
    int? page,
    int? totalResults,
    bool? hasReachedEnd,
    String? errorMessage,
  }) {
    return NewsListState(
      status: status ?? this.status,
      items: items ?? this.items,
      page: page ?? this.page,
      totalResults: totalResults ?? this.totalResults,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    items,
    page,
    totalResults,
    hasReachedEnd,
    errorMessage,
  ];
}
