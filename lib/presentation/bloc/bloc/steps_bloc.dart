import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_event.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonState(unlockedButtons: 0, lastCompletedStep: 0)) {
    on<IncrementButtonEvent>((event, emit) {
      if (event.completedStep == state.lastCompletedStep) {
        emit(
          ButtonState(
            unlockedButtons: state.unlockedButtons + 1,
            lastCompletedStep: event.completedStep + 1,
          ),
        );
      }
    });
  }
}
