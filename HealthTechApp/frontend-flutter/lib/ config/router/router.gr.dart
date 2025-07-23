// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:health_app/features/auth/presentation/pages/log_in_screen.dart'
    as _i3;
import 'package:health_app/features/auth/presentation/pages/sign_up_screen.dart'
    as _i5;
import 'package:health_app/features/form/presentation/pages/form_screen.dart'
    as _i1;
import 'package:health_app/features/home/presentation/pages/home_screen.dart'
    as _i2;
import 'package:health_app/features/result/presentation/result_screen.dart'
    as _i4;

/// generated route for
/// [_i1.FormScreen]
class FormRoute extends _i6.PageRouteInfo<void> {
  const FormRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FormRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.FormScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LogInScreen]
class LogInRoute extends _i6.PageRouteInfo<void> {
  const LogInRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.LogInScreen();
    },
  );
}

/// generated route for
/// [_i4.ResultScreen]
class ResultRoute extends _i6.PageRouteInfo<void> {
  const ResultRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ResultScreen();
    },
  );
}

/// generated route for
/// [_i5.SignUpScreen]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignUpScreen();
    },
  );
}
