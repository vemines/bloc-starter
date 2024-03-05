import 'package:bloc/bloc.dart';
import '../../data/models/post_model.dart';
import '../../data/repositories/post_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';
part 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  var repository = PostRepository();

  PostBloc() : super(InitialState()) {
    on<InitPostsEvent>(_fetchPosts);
    on<InitPostEvent>(_fetchPost);
  }

  Future<void> _fetchPosts(
    InitPostsEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(LoadingState());
      final response = await repository.fetchAllPosts();
      emit(PostsLoaded(response: response));
    } catch (e) {
      emit(PostsError(error: e.toString()));
    }
  }

  Future<void> _fetchPost(
    InitPostEvent event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(LoadingState());
      final response = await repository.fetchPost(event.id);
      if (response != null) {
        emit(PostLoaded(response: response));
      } else {
        emit(PostNotFound());
      }
    } catch (e) {
      emit(PostsError(error: e.toString()));
    }
  }
}
