import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String description;
  final String url;
  final String? imageUrl;
  final String? publishedAt;
  final String sourceName;
  final bool isBookmarked;

  const Article({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.sourceName,
    required this.isBookmarked,
  });

  Article copyWith({bool? isBookmarked}) {
    return Article(
      title: title,
      description: description,
      url: url,
      imageUrl: imageUrl,
      publishedAt: publishedAt,
      sourceName: sourceName,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  List<Object?> get props => [title, url, isBookmarked];
}
