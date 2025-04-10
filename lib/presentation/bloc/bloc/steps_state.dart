part of 'steps_bloc.dart';

class MeditationState extends Equatable {
  final Map<int, int> steps;

  const MeditationState({required this.steps});

  @override
  List<Object?> get props => [steps];
}
