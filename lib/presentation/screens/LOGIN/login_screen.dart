import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_horizon/components/log_and_ger_btn.dart';
import 'package:mind_horizon/components/row_text_for_log_reg_screen.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/BOTTOM/custom_bottom_nav_bar.dart';
import 'package:mind_horizon/presentation/screens/FORGOT_PASSWORD/screens/forgot_password.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/register_screen.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginWithCredential() async {
    try {
      AuthService authService = AuthService();

      await authService.loginWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  CustomBottomNavBar(), // Замени на экран, на который надо перейти
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Align(
            alignment: Alignment.center,
            child: Text("Ошибка авторизации"),
          ),
        ),
      );
    }
  }

  void _loginWithGoogle() async {
    try {
      final userCredential = await AuthService().registerGoogle();
      if (userCredential != null && mounted) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CustomBottomNavBar()),
        );
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Google Sign In was CANCELLED')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/img/reglogtop.png',
                scale:
                    screenHeight < 896
                        ? 1.3
                        /// Тест для СЕ
                        : screenHeight > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ), // 11 iphone
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/img/reglogbot.png',
                scale:
                    screenHeight < 896
                        ? 1.2
                        /// Тест для СЕ
                        : screenHeight > 896
                        ? 1
                        // 16 pro max
                        : 1,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildRegText(
                      text: 'Sign In',
                      fontSize:
                          screenHeight < 896
                              ? 24
                              /// Тест для СЕ
                              : screenHeight > 896
                              ? 30
                              // 16 pro max
                              : 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya',
                      color: Color(0xff455a64),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top:
                            screenHeight < 896
                                ? 40.0.h
                                /// Тест для СЕ
                                : screenHeight > 896
                                ? 58.0.h
                                // 16 pro max
                                : 58.0.h,
                      ),
                      child: SizedBox(
                        width:
                            screenHeight < 896
                                ? 250
                                /// Тест для СЕ
                                : screenHeight > 896
                                ? 300
                                // 16 pro max
                                : 300,
                        child: BuildRegText(
                          text:
                              'Sign in now to acces your excercises and saved music.',
                          fontSize:
                              screenHeight < 896
                                  ? 20
                                  /// Тест для СЕ
                                  : screenHeight > 896
                                  ? 24
                                  // 16 pro max
                                  : 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'AlegreyaSans',
                          color: Color(0xff455a64),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                    screenHeight < 896
                                        ? 30.0.h
                                        /// Тест для СЕ
                                        : screenHeight > 896
                                        ? 30.0.h
                                        // 16 pro max
                                        : 30.0.h,
                              ),
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
                              padding: EdgeInsets.only(
                                top:
                                    screenHeight < 896
                                        ? 30.0.h
                                        /// Тест для СЕ
                                        : screenHeight > 896
                                        ? 30.0.h
                                        // 16 pro max
                                        : 30.0.h,
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AlegreyaSans',
                                    color: Color(0xff455a64),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top:
                            screenHeight < 896
                                ? 50.0.h
                                /// Тест для СЕ
                                : screenHeight > 896
                                ? 43.0.h
                                // 16 pro max
                                : 43.0.h,
                        bottom:
                            screenHeight < 896
                                ? 34.0.h
                                /// Тест для СЕ
                                : screenHeight > 896
                                ? 43.0.h
                                // 16 pro max
                                : 43.0.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassword(),
                                  ),
                                ),
                            child: BuildRegText(
                              text: 'Forgot Password?',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'AlegreyaSans',
                              color: Color(0xff455a64),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        LogAndGerBtn(
                          textBtn: 'Login',
                          onTap: _loginWithCredential,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top:
                                screenHeight < 896
                                    ? 50.0.h
                                    /// Тест для СЕ
                                    : screenHeight > 896
                                    ? 50.0.h
                                    // 16 pro max
                                    : 50.0.h,
                            bottom:
                                screenHeight < 896
                                    ? 30.0.h
                                    /// Тест для СЕ
                                    : screenHeight > 896
                                    ? 45.0.h
                                    // 16 pro max
                                    : 45.0.h,
                          ),
                          child: GestureDetector(
                            onTap: _loginWithGoogle,
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              size:
                                  screenHeight < 896
                                      ? 40.0.h
                                      /// Тест для СЕ
                                      : screenHeight > 896
                                      ? 45.0.h
                                      // 16 pro max
                                      : 45.0.h,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        UnderButtonText(
                          firstText: 'Already have an account?',
                          secondText: 'Sign In',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
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
