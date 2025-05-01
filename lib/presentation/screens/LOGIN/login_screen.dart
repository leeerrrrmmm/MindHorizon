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
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

  Future<void> _loginWithCredential() async {
    try {
      AuthService authService = AuthService();

      await authService.loginWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('exit_type');
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
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('exit_type');
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: [
            Positioned(top: 0, child: Image.asset('assets/img/reglogtop.png')),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset('assets/img/reglogbot.png'),
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
                            width: 270.w,
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
                                Navigator.pushReplacement(
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
