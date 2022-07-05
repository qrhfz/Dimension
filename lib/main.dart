import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/pages/thread_page.dart';
import 'package:hn_client/view/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import 'view/providers/home_state.dart';

void main() async {
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
        darkTheme: ThemeData.dark(),
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
            path: 'item',
            builder: (context, state) {
              final id = int.parse(state.queryParams['id']!);
              log("$id");
              return ThreadPage(id);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/best',
        builder: (context, state) {
          return const HomePage(initialType: HomeContentType.best);
        },
      ),
      GoRoute(
        path: '/ask',
        builder: (context, state) {
          return const HomePage(initialType: HomeContentType.ask);
        },
      ),
      GoRoute(
        path: '/jobs',
        builder: (context, state) {
          return const HomePage(initialType: HomeContentType.job);
        },
      ),
      GoRoute(
        path: '/show',
        builder: (context, state) {
          return const HomePage(initialType: HomeContentType.show);
        },
      ),
      GoRoute(
        path: '/newest',
        builder: (context, state) {
          return const HomePage(initialType: HomeContentType.new_);
        },
      ),
    ],
    errorBuilder: (_, __) => const HomePage(),
  );
}
