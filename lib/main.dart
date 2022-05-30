import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/pages/browser_page.dart';
import 'package:hn_client/view/pages/comment_page.dart';
import 'package:hn_client/view/pages/thread_page.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'HackerNews Client',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0),
          primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Colors.white,
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
            path: 'thread/:id',
            builder: (context, state) {
              final id = int.parse(state.params['id']!);
              // final item = state.extra as Item?;
              return ThreadPage(id);
            },
          ),
          GoRoute(
            path: 'comment',
            builder: (context, state) {
              final parent = state.extra as Item;
              return CommentPage(parent: parent);
            },
          ),
          GoRoute(
            path: 'browser',
            builder: (context, state) {
              final url = state.extra as String;
              return BrowserPage(url);
            },
          ),
        ],
      ),
    ],
  );
}
