import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isGeneralNotificationEnabled = false;
  bool isSoundEnabled = false;
  bool isVibrateEnabled = false;

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
              top: MediaQuery.of(context).size.height * 0.07,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BuildText(
                  text: 'MindHorizon',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xfffea386),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xfffea386),
                    child: Center(
                      child: Icon(Icons.close, size: 30, color: Colors.white),
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
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffea386),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 49.0,
                    right: 49.0,
                    top: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // GENERAL NOTIFICATION
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                          color: Color(0xfffbe7c3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xfffea386)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BuildText(
                              text: 'General Notification',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffea386),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isGeneralNotificationEnabled =
                                      !isGeneralNotificationEnabled;
                                });
                              },
                              child: Image.asset(
                                isGeneralNotificationEnabled
                                    ? 'assets/img/off.png'
                                    : 'assets/img/on.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SOUND
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                            color: Color(0xfffbe7c3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xfffea386)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              BuildText(
                                text: 'Sound',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfffea386),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSoundEnabled = !isSoundEnabled;
                                  });
                                },
                                child: Image.asset(
                                  isSoundEnabled
                                      ? 'assets/img/off.png'
                                      : 'assets/img/on.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // VIBRATE
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                          color: Color(0xfffbe7c3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xfffea386)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BuildText(
                              text: 'Vibrate',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffea386),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVibrateEnabled = !isVibrateEnabled;
                                });
                              },
                              child: Image.asset(
                                isVibrateEnabled
                                    ? 'assets/img/off.png'
                                    : 'assets/img/on.png',
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
          ),
        ],
      ),
    );
  }
}
