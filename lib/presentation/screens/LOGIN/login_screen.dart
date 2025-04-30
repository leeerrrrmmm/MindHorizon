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

  Future<void> _loginWithCredential() async {
    try {
      AuthService authService = AuthService();

      await authService.loginWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNavBar()),
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

  Future<void> _loginWithGoogle() async {
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
    double screenWidth = MediaQuery.of(context).size.width;

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
                scale: screenHeight < 896 ? 1.3 : 1,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/img/reglogbot.png',
                scale: screenHeight < 896 ? 1.2 : 1,
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildRegText(
                          text: 'Sign In',
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alegreya',
                          color: Color(0xff455a64),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: SizedBox(
                            width: screenWidth < 896 ? 250.w : 300.w,
                            child: BuildRegText(
                              text:
                                  'Sign in now to access your exercises and saved music.',
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
                                  padding: EdgeInsets.only(top: 30.h),
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
                          padding: EdgeInsets.only(top: 50.h, bottom: 34.h),
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
                                  fontSize: 20.sp,
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
                              padding: EdgeInsets.only(top: 50.h, bottom: 45.h),
                              child: GestureDetector(
                                onTap: _loginWithGoogle,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
