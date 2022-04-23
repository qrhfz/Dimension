import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/pages/comments_page.dart';
import 'package:hn_client/view/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import 'models/item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'HackerNews Client',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'comments/:id',
            builder: (context, state) {
              final id = int.parse(state.params['id']!);
              final item = state.extra as Item?;
              return CommentsPage(id, post: item);
            },
          ),
        ],
      ),
    ],
  );
}
