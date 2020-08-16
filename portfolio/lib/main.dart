import 'package:flutter/material.dart';
import 'package:portfolio/components/main_screen_wrapper.dart';
import 'package:portfolio/core/bloc/initializing_bloc.dart';
import 'package:portfolio/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
      home: MainScreenWrapper(initializingBloc: InitializingBloc(),),
    );
  }
}

