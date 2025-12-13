import 'package:dio/dio.dart';
import 'package:flutter_news/core/network/dio_provider.dart';
import 'package:flutter_news/data/repositories/news_repository_impl.dart';
import 'package:flutter_news/data/sources/news_api.dart';
import 'package:flutter_news/domain/repositories/news_repository.dart';
import 'package:flutter_news/domain/usecases/get_top_headlines.dart';
import 'package:flutter_news/domain/usecases/toggle_bookmark.dart';
import 'package:flutter_news/presentation/bloc/news_list_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

Future<void> setupInjector() async {
  injector.registerLazySingleton<Dio>(() => DioProvider.create());
  injector.registerLazySingleton<NewsApi>(() => NewsApi(injector<Dio>()));
  injector.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(injector<NewsApi>()),
  );

  // use cases
  injector.registerLazySingleton(() => GetTopHeadlines(injector()));
  injector.registerLazySingleton(() => ToggleBookmark(injector()));

  // bloc
  injector.registerFactory(() => NewsListCubit(injector(), injector()));
}
