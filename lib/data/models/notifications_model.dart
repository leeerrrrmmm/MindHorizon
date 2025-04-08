class NotificationSettingsModel {
  final bool vibration;
  final bool sendNotification;

  NotificationSettingsModel({
    required this.vibration,
    required this.sendNotification,
  });

  factory NotificationSettingsModel.fromMap(Map<String, dynamic> map) {
    return NotificationSettingsModel(
      vibration: map['vibration'] ?? true,
      sendNotification: map['sendNotification'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {'vibration': vibration, 'sendNotification': sendNotification};
  }
}
