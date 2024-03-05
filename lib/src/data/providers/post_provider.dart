import 'package:dio/dio.dart';

class PostProvider {
  // Make it singleton
  PostProvider._();
  static final instance = PostProvider._();

  static String baseUrl = "https://jsonplaceholder.typicode.com";
  static BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      // ignore: missing_return
      validateStatus: (code) => code != null && code >= 200 ? true : false);
  Dio dio = Dio(options);

  Future<dynamic> fetchAll() async {
    Options options = Options(
      headers: {"Content-Type": "application/json"},
    );
    Response response = await dio.get('/posts', options: options);
    return response;
  }

  Future<dynamic> fetchOne({required String id}) async {
    Options options = Options(
      headers: {"Content-Type": "application/json"},
    );
    Response response = await dio.get('/posts/$id', options: options);
    return response;
  }
}
