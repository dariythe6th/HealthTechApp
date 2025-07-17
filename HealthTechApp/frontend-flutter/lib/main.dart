import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/%20config/router/router.dart';
import 'package:health_app/%20config/theme/theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: theme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
    );
  }
}
