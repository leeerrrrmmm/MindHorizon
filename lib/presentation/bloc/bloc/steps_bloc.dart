import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'steps_event.dart';
part 'steps_state.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  MeditationBloc() : super(MeditationState(steps: {}, isLoading: true)) {
    on<UpdateStepCount>(_onUpdateStepCount);
    on<LoadStepsFromStorage>(_onLoadStepsFromStorage);

    add(LoadStepsFromStorage());
  }

  Future<void> _onUpdateStepCount(
    UpdateStepCount event,
    Emitter<MeditationState> emit,
  ) async {
    final updatedSteps = {...state.steps, event.id: event.stepCount};
    emit(MeditationState(steps: updatedSteps));
    await _saveStepsToStorage(updatedSteps);
  }

  Future<void> _onLoadStepsFromStorage(
    LoadStepsFromStorage event,
    Emitter<MeditationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().getCurUserUid();
    final key = 'meditation_steps_user_$userId';

    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final steps = jsonMap.map(
        (key, value) => MapEntry(int.parse(key), value as int),
      );
      emit(MeditationState(steps: steps, isLoading: false));
    } else {
      emit(MeditationState(steps: {}, isLoading: false));
    }
  }

  Future<void> _saveStepsToStorage(Map<int, int> steps) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = AuthService().getCurUserUid();
    final key = 'meditation_steps_user_$userId';

    final jsonMap = steps.map((key, value) => MapEntry(key.toString(), value));
    final jsonString = json.encode(jsonMap);
    await prefs.setString(key, jsonString);
  }
}
