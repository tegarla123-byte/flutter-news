import 'package:flutter/material.dart';
import 'package:flutter_news/di/injector.dart';
import 'package:flutter_news/presentation/bloc/news_list_cubit.dart';
import 'package:flutter_news/presentation/bloc/news_list_state.dart';
import 'package:flutter_news/presentation/widgets/article_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<NewsListCubit>()..refresh(),
      child: const _NewsListView(),
    );
  }
}

class _NewsListView extends StatefulWidget {
  const _NewsListView();

  @override
  State<StatefulWidget> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<_NewsListView> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final cubit = context.read<NewsListCubit>();
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 300) {
        cubit.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top Headlines")),
      body: BlocBuilder<NewsListCubit, NewsListState>(
        builder: (context, state) {
          // loading
          if (state.status == LoadStatus.loading && state.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // error
          if (state.status == LoadStatus.failure && state.items.isEmpty) {
            return Center(child: Text(state.errorMessage ?? 'Error'));
          }

          return RefreshIndicator(
            onRefresh: context.read<NewsListCubit>().refresh,
            child: ListView.separated(
              controller: _controller,
              itemCount: state.items.length + 1,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) {
                if (index == state.items.length) {
                  if (state.hasReachedEnd) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: Text("No more articles")),
                    );
                  }

                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final article = state.items[index];
                return ArticleTile(
                  article: article,
                  onTap: () => context.push('/detail', extra: article),
                  onBookmark: () => context
                      .read<NewsListCubit>()
                      .onToggleBookmark(article.url),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
