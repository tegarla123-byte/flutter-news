import 'package:flutter/material.dart';
import 'package:flutter_news/core/config/flavor_config.dart';
import 'package:flutter_news/core/router/app_router.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: FlavorConfig.instance.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
