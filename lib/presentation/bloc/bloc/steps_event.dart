abstract class ButtonEvent {}

class IncrementButtonEvent extends ButtonEvent {
  final int completedStep;

  IncrementButtonEvent(this.completedStep);
}
