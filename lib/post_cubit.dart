// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_practise04/data_services.dart';
import 'package:bloc_practise04/post_model.dart';

class PostCubit extends Cubit<List<Post>> {
  DataServices _dataServices = DataServices();
  PostCubit() : super([]);

  void getPosts() async => emit(await _dataServices.getPosts());
}

abstract class PostEvent {}

class LoadPostEvent extends PostEvent {}

abstract class PostState {}

class LoadingPostState extends PostState {}

class LoadedPostState extends PostState {
  List<Post> posts;
  LoadedPostState({
    required this.posts,
  });
}

class FailedLoadPostState extends PostState {
  Error error;
  FailedLoadPostState({
    required this.error,
  });
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final DataServices _dataServices = DataServices();
  PostBloc() : super(LoadingPostState()) {
    on<LoadPostEvent>((event, emit) async {
      try {
        emit(LoadingPostState());
        final posts = await _dataServices.getPosts();
        emit(LoadedPostState(posts: posts));
      } on Error catch (e) {
        emit(FailedLoadPostState(error: e));
      }
    });
  }
}
