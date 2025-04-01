import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/profile/detail_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = AuthService().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),

      body: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset('assets/img/botFlow.png'),
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
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: CircleAvatar(
                      radius: 60,
                      child: Image.asset('assets/img/cuate.png'),
                    ),
                  ),
                  BuildText(
                    text: user?.displayName ?? 'User',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xfff19584),
                  ),
                  BuildText(
                    text: user?.email ?? 'user@gmail.com',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff19584),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 32.0,
                            bottom: 16.0,
                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  ...List.generate(
                                    4,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        index <= 1
                                            ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        DetailProfileScreen(
                                                          index: index,
                                                        ),
                                              ),
                                            )
                                            : showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text(
                                                    'This is a sample alert message.',
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                      },
                                                      child: Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            index == 0
                                                ? Icons.manage_accounts_outlined
                                                : index == 1
                                                ? Icons.notifications_outlined
                                                : index == 2
                                                ? Icons.exit_to_app
                                                : Icons.delete_outline,
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
                                  3,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DetailProfileScreen(
                                                index: index + 2,
                                              ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          index == 0
                                              ? Icons.help_outline
                                              : index == 1
                                              ? Icons.mark_email_read_outlined
                                              : Icons.lock_clock_outlined,
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
          ),
        ],
      ),
    );
  }
}
