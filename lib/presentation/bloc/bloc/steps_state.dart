class ButtonState {
  final int unlockedButtons;
  final int lastCompletedStep; // Запоминаем, какой шаг был завершен

  ButtonState({required this.unlockedButtons, required this.lastCompletedStep});
}
