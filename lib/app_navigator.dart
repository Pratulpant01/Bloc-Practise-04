import 'package:bloc_practise04/nav_bloc.dart';
import 'package:bloc_practise04/post_details.dart';
import 'package:bloc_practise04/post_model.dart';
import 'package:bloc_practise04/postview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(builder: ((context, post) {
      return Navigator(
        pages: [
          MaterialPage(
            child: PostView(),
          ),
          if (post != null)
            MaterialPage(
                child: PostDetailsView(
              post: post,
            ))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPost();
          return route.didPop(result);
        },
      );
    }));
  }
}
