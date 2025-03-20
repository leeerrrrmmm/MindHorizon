import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_event.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonState(0)) {
    on<IncrementButtonEvent>((event, emit) {
      final newState = ButtonState(state.unlockedButtons + 1);
      emit(newState);
    });
  }
}
