// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopHeadlinesResponseDto _$TopHeadlinesResponseDtoFromJson(
  Map<String, dynamic> json,
) => TopHeadlinesResponseDto(
  status: json['status'] as String?,
  totalResults: (json['totalResults'] as num?)?.toInt(),
  articles: (json['articles'] as List<dynamic>?)
      ?.map((e) => ArticleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TopHeadlinesResponseDtoToJson(
  TopHeadlinesResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'totalResults': instance.totalResults,
  'articles': instance.articles,
};

ArticleDto _$ArticleDtoFromJson(Map<String, dynamic> json) => ArticleDto(
  title: json['title'] as String?,
  description: json['description'] as String?,
  url: json['url'] as String?,
  urlToImage: json['urlToImage'] as String?,
  publishedAt: json['publishedAt'] as String?,
  source: json['source'] == null
      ? null
      : SourceDto.fromJson(json['source'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArticleDtoToJson(ArticleDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
    };

SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) =>
    SourceDto(name: json['name'] as String?);

Map<String, dynamic> _$SourceDtoToJson(SourceDto instance) => <String, dynamic>{
  'name': instance.name,
};
