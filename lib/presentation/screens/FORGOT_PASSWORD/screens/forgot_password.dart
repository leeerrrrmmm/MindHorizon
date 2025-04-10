import 'package:flutter/material.dart';
import 'package:mind_horizon/components/log_and_ger_btn.dart';
import 'package:mind_horizon/presentation/screens/FORGOT_PASSWORD/screens/check_email.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
              bottom: 0,
              child: Image.asset('assets/img/reglogbot.png'),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40,
                  top: 200.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildRegText(
                      text: 'Forgot password?',
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
                          text: 'Please enter your email to reset the password',
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'AlegreyaSans',
                          color: Color(0xff455a64),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 115.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 58.0),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
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
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        LogAndGerBtn(
                          textBtn: 'Reset Password',
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => CheckEmail(
                                        emailController: _emailController.text,
                                      ),
                                ),
                              ),
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
