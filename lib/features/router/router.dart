import 'package:go_router/go_router.dart';
import '../CategoryScreen/Category.dart';
import '../DetailScreen/Detail.dart';
import '../HomeScreen/Home.dart';
import '../SearchScreen/Search.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/details/:slug',
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return DetailScreen(
            slug: slug,
          );
        }),
    GoRoute(
      path: '/category/:slug',
      builder: (context, state) {
        final slug = state.pathParameters['slug']!;
        return CategoryScreen(
          slug: slug,
        );
      },
    ),
    GoRoute(
      path: '/search/:query',
      builder: (context, state) {
        final query = state.pathParameters['query']!;
        return SearchScreen(
          query: query,
        );
      },
    ),
  ],
);
