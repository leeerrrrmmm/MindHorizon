import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_horizon/data/models/notifications_model.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String password;
  final DateTime? createdAt;
  final NotificationSettingsModel notificationSettings;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.password,
    this.createdAt,
    required this.notificationSettings,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
      password: map['password'],
      createdAt:
          map['createdAt'] != null
              ? (map['createdAt'] as Timestamp).toDate()
              : null,
      notificationSettings:
          map['notificationSettings'] != null
              ? NotificationSettingsModel.fromMap(map['notificationSettings'])
              : NotificationSettingsModel(
                vibration: true,
                sendNotification: true,
              ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'password': password,
      'createdAt': createdAt,
      'notificationSettings': notificationSettings.toMap(),
    };
  }
}
