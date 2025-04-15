part of 'steps_bloc.dart';

abstract class MeditationEvent extends Equatable {
  const MeditationEvent();

  @override
  List<Object> get props => [];
}

class UpdateStepCount extends MeditationEvent {
  final int id;
  final int stepCount;

  const UpdateStepCount({required this.id, required this.stepCount});

  @override
  List<Object> get props => [id, stepCount];
}

class LoadStepsFromStorage extends MeditationEvent {}
