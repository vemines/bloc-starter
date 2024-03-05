import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/post/post_bloc.dart';
import '../../data/models/post_model.dart';
import '../../routes/app_pages.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostBloc()..add(InitPostEvent(id: id)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Fetch API"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go(Routes.posts),
            ),
          ),
          body: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PostNotFound) {
                return const Center(child: Text("Post not found"));
              } else if (state is PostLoaded) {
                return _PostWidget(post: state.response);
              } else if (state is PostError) {
                return Center(child: Text("Error: ${state.error}"));
              } else {
                return const Center(child: Text("Initial State"));
              }
            },
          ),
        ));
  }
}

class _PostWidget extends StatelessWidget {
  const _PostWidget({required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title ?? "No Post Title"),
      subtitle: Text(post.body ?? "No Post Body"),
      leading: Text(post.id.toString()),
    );
  }
}
