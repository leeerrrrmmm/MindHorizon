import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'steps_event.dart';
part 'steps_state.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  MeditationBloc() : super(MeditationState(steps: {})) {
    on<UpdateStepCount>(_onUpdateStepCount);
    on<LoadStepsFromStorage>(_onLoadStepsFromStorage);

    // Автоматически загружаем данные при создании блока
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
    final jsonString = prefs.getString('meditation_steps');
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final steps = jsonMap.map(
        (key, value) => MapEntry(int.parse(key), value as int),
      );
      emit(MeditationState(steps: steps));
    }
  }

  Future<void> _saveStepsToStorage(Map<int, int> steps) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonMap = steps.map((key, value) => MapEntry(key.toString(), value));
    final jsonString = json.encode(jsonMap);
    await prefs.setString('meditation_steps', jsonString);
  }
}
