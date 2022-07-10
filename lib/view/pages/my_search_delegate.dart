import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/pages/thread_page.dart';

import '../../common/time_converter.dart';
import '../../models/failure.dart';
import '../../models/search_item.dart';
import '../../repository/repository.dart';

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate(this.ref);

  final WidgetRef ref;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final repo = ref.read(repositoryProvider);
    final searchResults = repo.search(query);

    return FutureBuilder<Either<Failure, List<SearchItem>>>(
      future: searchResults,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('App Error'));
        } else if (snapshot.hasData) {
          return snapshot.data!.fold(
            (l) => Center(child: Text(l.message)),
            (r) => ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(r[index].title ?? ""),
                  subtitle: Text(
                      "${r[index].author} ${formatTime(r[index].createdAt)}"),
                  onTap: () {
                    if (r[index].id == null) return;
                    GoRouter.of(context)
                        .go(ThreadPage.routeBuilder(r[index].id!));
                  },
                );
              },
              itemCount: r.length,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
