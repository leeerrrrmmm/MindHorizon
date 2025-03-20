import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/screens/BOTTOM/custom_bottom_nav_bar.dart';

void main() {
  runApp(BlocProvider(create: (context) => ButtonBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomBottomNavBar(),
    );
  }
}
