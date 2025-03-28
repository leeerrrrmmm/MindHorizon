import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/presentation/screens/BOTTOM/custom_bottom_nav_bar.dart';
import 'package:mind_horizon/presentation/screens/LOGIN/login_screen.dart';
import 'package:mind_horizon/presentation/screens/MUSIC_SCREEN/music_screen.dart';
import 'package:mind_horizon/testt/a.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeditationBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MusicScreen(),
      ),
    );
  }
}

/**
 *! При переходе с логина на регистрацию сделать отображение кнопки перехода(без аппБара)
 *! Сделать апп бар для каждого екрана и правильные отступы
 *! логика регистраций сделана -> завтра нужно реализовать авторизацию,отображения данных пользователя и тд
 *? и сделать еще update UserInfo и добавить уведомления 
 */
