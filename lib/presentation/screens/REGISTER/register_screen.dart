import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void _registerWithCredential() async {
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
        CupertinoPageRoute(builder: (context) => CustomBottomNavBar()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Ошибка: Регистрации")));
    }
  }

  void _registerWithGoogle() async {
    try {
      AuthService authService = AuthService();
      final user = authService.getCurrentUser();

      await authService.registerGoogle();

      if (!mounted) return;
      if(user != null) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder:
                (context) =>
                CustomBottomNavBar(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Align(
                alignment: Alignment.center,
                child: Text("Success"),
              ),
            ));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Align(
                alignment: Alignment.center,
                child: Text("Ошибка авторизации"),
              ),
            ));
      }
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
                    text: 'Sign Up',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya',
                    color: Color(0xff455a64),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.0),
                    child: SizedBox(
                      width: 300,
                      child: BuildRegText(
                        text:
                            'Sign up for free and start meditating, and explore Medic.',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'AlegreyaSans',
                        color: Color(0xff455a64),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 43.0),
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
                            padding: const EdgeInsets.only(top: 58.0),
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

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 44.0, bottom: 15.0),
                        child: LogAndGerBtn(
                          textBtn: 'Sign Up',
                          onTap: _registerWithCredential,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 44.0, bottom: 15.0),
                        child: LogAndGerBtn(
                          textBtn: 'Sign Up',
                          onTap:  _registerWithGoogle,
                        ),
                      ),
                      Center(
                        child: UnderButtonText(
                          firstText: 'Already have an account?',
                          secondText: 'Sign In',
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
