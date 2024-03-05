part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

// Same state of Post and Posts
final class InitialState extends PostState {}

final class LoadingState extends PostState {}

// Post state
final class PostLoaded extends PostState {
  const PostLoaded({required this.response});

  final PostModel response;
}

final class PostError extends PostState {
  const PostError({required this.error});

  final String error;
}

final class PostNotFound extends PostState {}

// Posts state
final class PostsLoaded extends PostState {
  const PostsLoaded({required this.response});

  final List<PostModel> response;
}

final class PostsError extends PostState {
  const PostsError({required this.error});

  final String error;
}
