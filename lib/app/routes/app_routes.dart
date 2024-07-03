// app_routes.dart

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const SCAN = _Paths.SCAN;
  static const DETAIL = _Paths.DETAIL;
  static const INPUT = _Paths.INPUT;
  static const CALL = _Paths.CALL;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const SCAN = '/scan';
  static const DETAIL = '/detail';
  static const INPUT = '/input';
  static const CALL = '/call';
}