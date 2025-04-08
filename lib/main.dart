import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/presentation/screens/BOTTOM/custom_bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mind_horizon/presentation/screens/LOGIN/login_screen.dart';
import 'package:mind_horizon/testt/a.dart';
import 'data/domain/auth/push.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseMsg().init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => MeditationBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
