import 'package:flutter_news/core/router/route_const.dart';
import 'package:flutter_news/domain/entities/article.dart';
import 'package:flutter_news/presentation/pages/early_warning_system_page.dart';
import 'package:flutter_news/presentation/pages/news_detail_page.dart';
import 'package:flutter_news/presentation/pages/news_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteConst.earlyWarningSystemPage,
    routes: [
      GoRoute(
      name: RouteConst.earlyWarningSystemPage,
      path: RouteConst.earlyWarningSystemPage,
      builder: (context, state) {
        return const EarlyWarningSystemPage();
      },
    ),
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
