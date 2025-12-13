import 'package:dio/dio.dart';
import 'package:flutter_news/data/models/article_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api.g.dart';

@RestApi()
abstract class NewsApi {
  factory NewsApi(Dio dio, {String baseUrl}) = _NewsApi;

  @GET('/top-headlines')
  Future<TopHeadlinesResponseDto> getTopHeadlines({
    @Query('country') required String country,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });
}
