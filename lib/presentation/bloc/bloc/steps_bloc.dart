import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'steps_event.dart';
part 'steps_state.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  MeditationBloc() : super(MeditationState(steps: {})) {
    on<UpdateStepCount>((event, emit) {
      emit(MeditationState(steps: {...state.steps, event.id: event.stepCount}));
    });
  }
}
