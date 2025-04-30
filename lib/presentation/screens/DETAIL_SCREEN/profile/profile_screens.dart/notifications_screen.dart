import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isGeneralNotificationEnabled = true;
  bool isVibrateEnabled = true;

  // Получаем настройки уведомлений пользователя из Firebase
  Future<void> getUserNotificationSettings() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var snapshot =
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .get();

      if (snapshot.exists) {
        setState(() {
          isGeneralNotificationEnabled =
              snapshot['notificationSettings']['sendNotification'] ?? true;
          isVibrateEnabled =
              snapshot['notificationSettings']['vibration'] ?? true;
        });
      }
    }
  }

  // Обновляем настройки уведомлений в Firestore
  Future<void> updateNotificationSettings({
    required bool isGeneralNotificationEnabled,
    required bool isVibrateEnabled,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).update(
        {
          'notificationSettings': {
            'vibration': isVibrateEnabled,
            'sendNotification': isGeneralNotificationEnabled,
          },
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getUserNotificationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: Image.asset('assets/img/flow.png')),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/img/botFlow.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 50.h, // адаптировано с помощью ScreenUtil
              left: 20.w, // адаптировано с помощью ScreenUtil
              right: 20.w, // адаптировано с помощью ScreenUtil
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BuildText(
                  text: 'MindHorizon',
                  fontSize: 20.sp, // адаптировано с помощью ScreenUtil
                  fontWeight: FontWeight.w700,
                  color: Color(0xfffea386),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 22.r, // адаптировано с помощью ScreenUtil
                    backgroundColor: Color(0xfffea386),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 30.sp,
                        color: Colors.white,
                      ), // адаптировано с помощью ScreenUtil
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BuildText(
                  text: 'Notifications',
                  fontSize: 24.sp, // адаптировано с помощью ScreenUtil
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffea386),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 49.w, // адаптировано с помощью ScreenUtil
                    right: 49.w, // адаптировано с помощью ScreenUtil
                    top: 10.h, // адаптировано с помощью ScreenUtil
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // GENERAL NOTIFICATION
                      Container(
                        padding: EdgeInsets.all(
                          8.w,
                        ), // адаптировано с помощью ScreenUtil
                        width: double.infinity,
                        height: 65.h, // адаптировано с помощью ScreenUtil
                        decoration: BoxDecoration(
                          color: Color(0xfffbe7c3),
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ), // адаптировано с помощью ScreenUtil
                          border: Border.all(color: Color(0xfffea386)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BuildText(
                              text: 'General Notification',
                              fontSize:
                                  16.sp, // адаптировано с помощью ScreenUtil
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffea386),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isGeneralNotificationEnabled =
                                      !isGeneralNotificationEnabled;
                                });
                                updateNotificationSettings(
                                  isGeneralNotificationEnabled:
                                      isGeneralNotificationEnabled,
                                  isVibrateEnabled: isVibrateEnabled,
                                );
                              },
                              child: Image.asset(
                                isGeneralNotificationEnabled
                                    ? 'assets/img/on.png'
                                    : 'assets/img/off.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      // VIBRATE
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                        ), // адаптировано с помощью ScreenUtil
                        child: Container(
                          padding: EdgeInsets.all(
                            8.w,
                          ), // адаптировано с помощью ScreenUtil
                          width: double.infinity,
                          height: 65.h, // адаптировано с помощью ScreenUtil
                          decoration: BoxDecoration(
                            color: Color(0xfffbe7c3),
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ), // адаптировано с помощью ScreenUtil
                            border: Border.all(color: Color(0xfffea386)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              BuildText(
                                text: 'Vibrate',
                                fontSize:
                                    16.sp, // адаптировано с помощью ScreenUtil
                                fontWeight: FontWeight.w400,
                                color: Color(0xfffea386),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVibrateEnabled = !isVibrateEnabled;
                                  });
                                  updateNotificationSettings(
                                    isGeneralNotificationEnabled:
                                        isGeneralNotificationEnabled,
                                    isVibrateEnabled: isVibrateEnabled,
                                  );
                                },
                                child: Image.asset(
                                  isVibrateEnabled
                                      ? 'assets/img/on.png'
                                      : 'assets/img/off.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
