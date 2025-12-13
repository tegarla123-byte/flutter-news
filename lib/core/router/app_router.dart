import 'package:flutter_news/domain/entities/article.dart';
import 'package:flutter_news/presentation/pages/news_detail_page.dart';
import 'package:flutter_news/presentation/pages/news_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const NewsListPage()),
      GoRoute(
        path: '/detail',
        builder: (_, state) {
          final article = state.extra as Article;
          return NewsDetailPage(article: article);
        },
      ),
    ],
  );
}
