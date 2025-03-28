import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_horizon/components/log_and_ger_btn.dart';
import 'package:mind_horizon/components/row_text_for_log_reg_screen.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/BOTTOM/custom_bottom_nav_bar.dart';
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
        CupertinoPageRoute(
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
      if (userCredential != null) {
        await Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => CustomBottomNavBar()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Google Sign In was CANCELLED')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, child: Image.asset('asset/img/reglogtop.png')),
          Positioned(bottom: 0, child: Image.asset('asset/img/reglogbot.png')),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildRegText(
                    text: 'Sign In',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya',
                    color: Color(0xff455a64),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.0),
                    child: BuildRegText(
                      text:
                          'Sign in now to access your exercises and saved music.',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'AlegreyaSans',
                      color: Color(0xff455a64),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 43.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 58.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Восстановление пароля
                        },
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
                  Padding(
                    padding: const EdgeInsets.only(top: 49.0, bottom: 15.0),
                    child: LogAndGerBtn(
                      textBtn: 'Login',
                      onTap: _loginWithCredential,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 49.0, bottom: 15.0),
                    child: LogAndGerBtn(
                      textBtn: 'Google',
                      onTap: _loginWithGoogle,
                    ),
                  ),
                  UnderButtonText(
                    firstText: "Don't have an account?",
                    secondText: 'Sign Up',
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
