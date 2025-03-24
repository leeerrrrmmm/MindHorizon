import 'package:flutter/material.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/profile/profile_screens.dart/contact_us_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/profile/profile_screens.dart/edit_profile_info.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/profile/profile_screens.dart/help_and_support.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/profile/profile_screens.dart/notifications_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/profile/profile_screens.dart/privacy_and_policy_screen.dart';

class DetailProfileScreen extends StatelessWidget {
  final int index;
  const DetailProfileScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          index == 0
              ? EditProfileInfo()
              : index == 1
              ? NotificationsScreen()
              : index == 2
              ? HelpAndSupport()
              : index == 3
              ? ContactUsScreen()
              : PrivacyAndPolicyScreen(),
    );
  }
}
