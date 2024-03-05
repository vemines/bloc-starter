// ignore_for_file: constant_identifier_names

import 'package:bloc_starter/src/views/static/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/post/post_screen.dart';
import '../views/post/posts_screen.dart';
import '../views/preview/preview_screen.dart';
import '../views/static/developing_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.preview;

  static final GoRouter router = GoRouter(
    initialLocation: INITIAL,
    // Page not found
    errorBuilder: (context, state) => const NotFoundScreen(),
    routes: <GoRoute>[
      GoRoute(
        path: Routes.posts,
        name: "posts",
        builder: (BuildContext context, GoRouterState state) {
          return const PostsScreen();
        },
      ),
      GoRoute(
        path: Routes.post,
        name: "post",
        builder: (BuildContext context, GoRouterState state) {
          String id = state.pathParameters["id"] ?? "0";
          return PostScreen(id: id);
        },
      ),
      GoRoute(
          path: Routes.preview,
          name: "preview",
          builder: (BuildContext context, GoRouterState state) {
            return const PreviewScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: Routes.developing,
              name: "developing",
              builder: (BuildContext context, GoRouterState state) {
                return const DevelopingScreen();
              },
            ),
          ]),
    ],
  );
}
