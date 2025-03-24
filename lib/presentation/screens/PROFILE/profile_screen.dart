import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset('asset/img/botFlow.png'),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: 264,
              decoration: BoxDecoration(
                color: Color(0xfffbe7c3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 25),
                  bottomRight: Radius.elliptical(300, 25),
                ),
              ),
            ),
          ),
          Positioned(
            top: 74,
            left: 25,
            child: BuildText(
              text: 'MindHorizon',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xfffea386),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: CircleAvatar(
                    radius: 60,
                    child: Image.asset('asset/img/cuate.png'),
                  ),
                ),
                BuildText(
                  text: 'Lerm Top',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff19584),
                ),
                BuildText(
                  text: 'Lerm Top@gmail.com',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xfff19584),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Color(0xfffbe7c3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0xff000000,
                                ).withValues(alpha: 0.05),
                                offset: Offset(10, 20),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ...List.generate(
                                  4,
                                  (index) => Row(
                                    children: <Widget>[
                                      Icon(
                                        index == 0
                                            ? Icons.info_rounded
                                            : index == 1
                                            ? Icons.notifications_rounded
                                            : index == 2
                                            ? Icons.exit_to_app
                                            : Icons.delete_rounded,
                                        color: Color(0xfff19584),
                                      ),
                                      Text(
                                        index == 0
                                            ? '\tEdit profile information'
                                            : index == 1
                                            ? '\tNotifications'
                                            : index == 2
                                            ? '\tExit'
                                            : '\tDelete Account',
                                        style: TextStyle(
                                          color: Color(0xfff19584),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Color(0xfffbe7c3),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withValues(alpha: 0.05),
                              offset: Offset(10, 20),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ...List.generate(
                                3,
                                (index) => Row(
                                  children: <Widget>[
                                    Icon(
                                      index == 0
                                          ? Icons.info_rounded
                                          : index == 1
                                          ? Icons.notifications_rounded
                                          : Icons.delete_rounded,
                                      color: Color(0xfff19584),
                                    ),
                                    Text(
                                      index == 0
                                          ? '\tHelp & Support'
                                          : index == 1
                                          ? '\tContact us'
                                          : '\tPrivacy policy',
                                      style: TextStyle(
                                        color: Color(0xfff19584),
                                      ),
                                    ),
                                  ],
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
