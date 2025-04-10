import 'package:flutter/material.dart';
import 'package:mind_horizon/components/log_and_ger_btn.dart';
import 'package:mind_horizon/presentation/screens/FORGOT_PASSWORD/screens/set_new_pass.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      text: 'Password Reset',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya',
                      color: Color(0xff455a64),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27.0),
                      child: SizedBox(
                        width: 370,
                        child: BuildRegText(
                          text:
                              'Your password has been successfully reser, click confirm to set a new password',
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'AlegreyaSans',
                          color: Color(0xff455a64),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Center(child: Image.asset('assets/img/reset.png')),
                    ),

                    Column(
                      children: [
                        LogAndGerBtn(
                          textBtn: 'Confirm',
                          onTap:
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SetNewPass(),
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
