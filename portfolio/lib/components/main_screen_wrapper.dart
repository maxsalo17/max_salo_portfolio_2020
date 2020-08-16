import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/loading_screen.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/core/bloc/initializing_bloc.dart';
import 'package:portfolio/pages/home_page.dart';

class MainScreenWrapper extends StatelessWidget {
  final InitializingBloc initializingBloc;

  const MainScreenWrapper({Key key, this.initializingBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: StreamBuilder<AppInitializationState>(
          stream: initializingBloc.initializationStateChanged,
          builder: (context, iniState) {
            switch (iniState.data?.state) {
              case InitializationState.initializing:
                return LoadingScreen(
                  size: size,
                  onLoad: initializingBloc.onInitializationCompleted,
                );
                break;
              case InitializationState.completed:
                return Container(
                  child: Animator<double>(
                      duration: Duration(milliseconds: 2000),
                      curve: Curves.easeInCubic,
                      tween: Tween<double>(begin: 1.0, end: 0.0),
                      builder: (ctx, anim, child) {
                        return Stack(
                          children: [
                            child,
                            IgnorePointer(
                                child: Container(
                              color: Cl.dark.withOpacity(anim.value),
                              width: size.width,
                              height: size.height,
                            ))
                          ],
                        );
                      },
                      child: HomePage(screenSize: size)),
                );
                break;
              default:
                return Container(
                  width: size.width,
                  height: size.height,
                  color: Cl.dark,
                );
            }
          }),
    );
  }
}
