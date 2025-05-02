import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_horizon/components/log_and_ger_btn.dart';
import 'package:mind_horizon/components/row_text_for_log_reg_screen.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/BOTTOM/custom_bottom_nav_bar.dart';
import 'package:mind_horizon/presentation/screens/LOGIN/login_screen.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool obscureText = true;

  Future<void> _registerWithCredential() async {
    try {
      AuthService authService = AuthService();

      await authService.registerWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNavBar()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Ошибка: Регистрации")));
    }
  }

  Future<void> _registerWithGoogle() async {
    try {
      AuthService authService = AuthService();
      authService
          .registerGoogle()
          .then((userCredential) {
            final user = userCredential?.user;
            if (user != null) {
              if (!mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CustomBottomNavBar()),
              );
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Успешная регистрация")));
            } else {
              if (!mounted) return;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Пользователь не найден")));
            }
          })
          .catchError((e) {
            String errorMessage = "Ошибка регистрации: $e";
            if (e.toString().contains('network')) {
              errorMessage = "Проверьте подключение к интернету.";
            }
            if (!mounted) return;

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMessage)));
          });
    } catch (e) {
      log('Register error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset('assets/img/reglogtop.png', scale: 1.0),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset('assets/img/reglogbot.png', scale: 1.0),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildRegText(
                      text: 'Sign Up',
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya',
                      color: Color(0xff455a64),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: SizedBox(
                        width: 300.w,
                        child: BuildRegText(
                          text:
                              'Sign up for free and start meditating, and explore Medic.',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'AlegreyaSans',
                          color: Color(0xff455a64),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'AlegreyaSans',
                                  color: Color(0xff455a64),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AlegreyaSans',
                                    color: Color(0xff455a64),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h, bottom: 50.h),
                              child: TextFormField(
                                obscureText: obscureText,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AlegreyaSans',
                                    color: Color(0xff455a64),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    icon: Icon(
                                      obscureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        LogAndGerBtn(
                          textBtn: 'Sign Up',
                          onTap: _registerWithCredential,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50.h, bottom: 45.h),
                          child: GestureDetector(
                            onTap: _registerWithGoogle,
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              size: 45.sp,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        UnderButtonText(
                          firstText: 'Already have an account?',
                          secondText: 'Sign In',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
