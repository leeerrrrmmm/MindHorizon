import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mind_horizon/data/domain/gate/auth_gate.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
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
    final designSize =
        Platform.isAndroid ? const Size(340, 900) : const Size(414, 898);

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => MeditationBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthGate(),
          ),
        );
      },
    );
  }
}
