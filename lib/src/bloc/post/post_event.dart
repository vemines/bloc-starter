part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class InitPostsEvent extends PostEvent {}

class InitPostEvent extends PostEvent {
  final String id;
  const InitPostEvent({required this.id});
}
