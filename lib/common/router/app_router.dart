import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_analytics/feature/feature.dart';
import 'package:onsite_analytics/feature/non_home/non_home.dart';

part 'app_router.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<NonHomeRoute>(
  path: '/non-home/:pageName',
)
class NonHomeRoute extends GoRouteData {
  const NonHomeRoute({required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      NonHomePage(pageName: pageName);
}
