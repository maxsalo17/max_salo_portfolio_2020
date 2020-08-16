import 'package:rxdart/rxdart.dart';

class InitializingBloc {
  var _initializationStateController =
      BehaviorSubject<AppInitializationState>.seeded(
          AppInitializationState(InitializationState.initializing));

  Stream<AppInitializationState> get initializationStateChanged =>
      _initializationStateController.stream;

  onInitializationCompleted() {
    _initializationStateController.sink
        .add(AppInitializationState(InitializationState.completed));
  }

  onInitializationRejected() {
    _initializationStateController.sink
        .add(AppInitializationState(InitializationState.rejected));
  }

  onInitializationProccess() {
    _initializationStateController.sink
        .add(AppInitializationState(InitializationState.initializing));
  }

  dispose() {
    _initializationStateController.close();
  }
}

class AppInitializationState {
  final InitializationState state;
  final dynamic payload;

  AppInitializationState(this.state, {this.payload});
}

enum InitializationState { none, initializing, completed, rejected }
