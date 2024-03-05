import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/post/post_bloc.dart';
import '../../data/models/post_model.dart';
import '../../routes/app_pages.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(InitPostsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fetch API"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(Routes.preview),
          ),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostsLoaded) {
              if ((state.response).isEmpty) {
                return const Center(child: Text("Posts is empty"));
              }
              return ListView.builder(
                itemBuilder: (context, index) => _PostWidget(post: state.response[index]),
                itemCount: state.response.length,
              );
            } else if (state is PostError) {
              return Center(child: Text("Error: ${state.error}"));
            } else {
              return const Center(child: Text("Initial State"));
            }
          },
        ),
      ),
    );
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
        onTap: () => context.goNamed('post', pathParameters: {'id': post.id.toString()}));
  }
}
