import 'package:go_router/go_router.dart';
import 'package:proyecto_profe/screens/screens.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
];
