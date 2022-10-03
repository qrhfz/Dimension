import 'dart:developer';

import 'package:dimension/home/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'thread/thread_page.dart';
import 'home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'home/home_state.dart';

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
        routeInformationProvider: _router.routeInformationProvider,
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
            pageBuilder: (context, state) {
              final id = int.parse(state.queryParams['id']!);
              return MaterialPage(
                key: ValueKey(id),
                child: ThreadPage(
                  id,
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/best',
        builder: (context, state) {
          return ProviderScope(overrides: [
            homeContentTypeProvider.overrideWithValue(
              StateController(HomeContentType.best),
            )
          ], child: const HomePage());
        },
      ),
      GoRoute(
        path: '/ask',
        builder: (context, state) {
          return ProviderScope(overrides: [
            homeContentTypeProvider.overrideWithValue(
              StateController(HomeContentType.ask),
            )
          ], child: const HomePage());
        },
      ),
      GoRoute(
        path: '/jobs',
        builder: (context, state) {
          return ProviderScope(overrides: [
            homeContentTypeProvider.overrideWithValue(
              StateController(HomeContentType.job),
            )
          ], child: const HomePage());
        },
      ),
      GoRoute(
        path: '/show',
        builder: (context, state) {
          return ProviderScope(overrides: [
            homeContentTypeProvider.overrideWithValue(
              StateController(HomeContentType.show),
            )
          ], child: const HomePage());
        },
      ),
      GoRoute(
        path: '/newest',
        builder: (context, state) {
          return ProviderScope(
            overrides: [
              homeContentTypeProvider.overrideWithValue(
                StateController(HomeContentType.new_),
              )
            ],
            child: const HomePage(),
          );
        },
      ),
    ],
    errorBuilder: (_, __) => const HomePage(),
  );
}
