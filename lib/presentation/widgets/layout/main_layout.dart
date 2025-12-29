import 'package:flutter/material.dart';
import 'package:flutter_news/presentation/widgets/main_drawer.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.child,
    this.title = 'Page Title',
    this.floatingActionButton,
  });

  final String title;
  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: MainDrawer(),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
