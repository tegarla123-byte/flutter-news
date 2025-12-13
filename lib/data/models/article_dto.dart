import 'package:flutter_news/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_dto.g.dart';

@JsonSerializable()
class TopHeadlinesResponseDto {
  final String? status;
  final int? totalResults;
  final List<ArticleDto>? articles;

  TopHeadlinesResponseDto({this.status, this.totalResults, this.articles});

  factory TopHeadlinesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TopHeadlinesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TopHeadlinesResponseDtoToJson(this);
}

@JsonSerializable()
class ArticleDto {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final SourceDto? source;

  ArticleDto({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.source,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDtoToJson(this);

  Article toEntity({required bool isBookmarked}) {
    return Article(
      title: title ?? '-',
      description: description ?? '',
      url: url ?? '',
      imageUrl: urlToImage,
      publishedAt: publishedAt,
      sourceName: source?.name ?? '',
      isBookmarked: isBookmarked,
    );
  }
}

@JsonSerializable()
class SourceDto {
  final String? name;

  SourceDto({this.name});

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SourceDtoToJson(this);
}
