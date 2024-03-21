import 'package:dio/dio.dart';

import '../models/post_model.dart';

class PostRepository {
  PostRepository._();
  static final instance = PostRepository._();

  static String baseUrl = "https://jsonplaceholder.typicode.com";
  static BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      // ignore: missing_return
      validateStatus: (code) => code != null && code >= 200 ? true : false);
  Dio dio = Dio(options);

  Future<List<PostModel>> fetchAllPosts() async {
    final Response response = await dio.get('/posts');
    if (response.statusCode == 200) {
      final List<dynamic> body = response.data ?? [];
      final List<PostModel> posts = body.map((i) {
        final model = PostModel.fromJson(i);
        return model;
      }).toList();
      // If the request is successful, return the list of PostModel
      return posts;
    } else {
      // If the request is not successful, throw an error
      throw Exception('Failed to load posts');
    }
  }

  Future<PostModel?> fetchPost(String id) async {
    final Response response = await dio.get('/posts/$id');
    if (response.statusCode == 200) {
      final dynamic body = response.data;
      if (body != null) {
        final PostModel post = PostModel.fromJson(body);
        return post;
      }
      // If the request is successful, return the list of PostModel
      throw Exception('Failed to convert post');
    } else if (response.statusCode == 404) {
      return null;
    } else {
      // If the request is not successful, throw an error
      throw Exception('Failed to load post');
    }
  }
}
