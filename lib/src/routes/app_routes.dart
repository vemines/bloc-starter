part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const posts = _Paths.posts;
  static const post = _Paths.post;

  static const preview = _Paths.preview;

  static const developing = _Paths.developing;
  static const developingRoute = "${_Paths.preview}/${_Paths.developing}";
}

abstract class _Paths {
  _Paths._();
  static const posts = '/post/all';
  static const post = '/post/:id';

  static const preview = '/preview';
  static const developing = 'developing';
}
