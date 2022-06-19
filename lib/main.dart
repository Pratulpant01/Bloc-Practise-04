import 'package:bloc_practise04/app_navigator.dart';
import 'package:bloc_practise04/nav_bloc.dart';
import 'package:bloc_practise04/post_cubit.dart';
import 'package:bloc_practise04/postview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavCubit>(
            create: (context) => NavCubit(),
          ),
          BlocProvider(
            create: (context) => PostBloc()
              ..add(
                LoadPostEvent(),
              ),
          ),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
