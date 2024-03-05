import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../models/post_model.dart';
import '../providers/post_provider.dart';

class PostRepository {
  final String postsKey = "postsKey";

  Future<List<PostModel>> fetchAllPosts() async {
    // test cache object with hive
    if (!Hive.isAdapterRegistered(PostAdapter().typeId)) {
      Hive.registerAdapter(PostAdapter());
    }
    var box = await Hive.openBox<PostModel>(postsKey);
    if (box.values.isNotEmpty) {
      return box.values.toList();
    }

    final Response response = await PostProvider.instance.fetchAll();
    if (response.statusCode == 200) {
      final List<dynamic> body = response.data ?? [];
      final List<PostModel> posts = body.map((i) {
        final model = PostModel.fromJson(i);
        // add model to hive
        box.add(model);
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
    // test cache object with hive
    if (!Hive.isAdapterRegistered(PostAdapter().typeId)) {
      Hive.registerAdapter(PostAdapter());
    }
    var box = await Hive.openBox<PostModel>("post/$id");
    if (box.values.isNotEmpty) {
      return box.values.first;
    }

    final Response response = await PostProvider.instance.fetchOne(id: id);
    if (response.statusCode == 200) {
      final dynamic body = response.data;
      if (body != null) {
        final PostModel post = PostModel.fromJson(body);
        box.add(post);
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
