import 'package:auto_route/auto_route.dart';
import 'package:health_app/%20config/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LogInRoute.page, path: '/'),
    AutoRoute(page: SignUpRoute.page, path: '/signUp'),
  ];
}
