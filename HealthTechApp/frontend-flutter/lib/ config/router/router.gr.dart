// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:health_app/features/auth/presentation/pages/log_in_screen.dart'
    as _i2;
import 'package:health_app/features/auth/presentation/pages/sign_up_screen.dart'
    as _i3;
import 'package:health_app/features/form/presentation/pages/form_screen.dart'
    as _i1;

/// generated route for
/// [_i1.FormScreen]
class FormRoute extends _i4.PageRouteInfo<void> {
  const FormRoute({List<_i4.PageRouteInfo>? children})
      : super(
          FormRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.FormScreen();
    },
  );
}

/// generated route for
/// [_i2.LogInScreen]
class LogInRoute extends _i4.PageRouteInfo<void> {
  const LogInRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LogInScreen();
    },
  );
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpRoute extends _i4.PageRouteInfo<void> {
  const SignUpRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignUpScreen();
    },
  );
}
