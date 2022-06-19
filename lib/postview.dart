import 'package:bloc_practise04/nav_bloc.dart';
import 'package:bloc_practise04/post_cubit.dart';
import 'package:bloc_practise04/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedPostState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostBloc>().add(LoadPostEvent());
              },
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        BlocProvider.of<NavCubit>(context).showPostDetails(
                          state.posts[index],
                        );
                      },
                      title: Text(
                        state.posts[index].title,
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
