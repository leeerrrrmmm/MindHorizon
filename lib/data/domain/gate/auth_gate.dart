import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/BOTTOM/custom_bottom_nav_bar.dart';
import 'package:mind_horizon/presentation/screens/LOGIN/login_screen.dart';
import 'package:mind_horizon/presentation/screens/ONBOARDING/onboarding.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService().getCurrentUser();
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (snap.hasError) {
            return Center(child: Text(snap.error.toString()));
          }

          if (snap.hasData) {
            var user = FirebaseAuth.instance.currentUser;
            if (user != null && auth != null && user.uid != auth.uid) {
              return CustomBottomNavBar();
            } else {
              return LoginScreen();
            }
          } else {
            return Onboarding();
          }
        },
      ),
    );
  }
}
