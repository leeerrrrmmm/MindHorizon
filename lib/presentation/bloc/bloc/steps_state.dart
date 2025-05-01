part of 'steps_bloc.dart';

class MeditationState extends Equatable {
  final Map<int, int> steps;
  final bool isLoading;
  const MeditationState({required this.steps, this.isLoading = false});

  @override
  List<Object?> get props => [steps, isLoading];
}
