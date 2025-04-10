import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/log_and_ger_btn.dart';
import 'package:mind_horizon/presentation/screens/FORGOT_PASSWORD/screens/set_new_pass.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key, required this.emailController});
  final String emailController;

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  @override
  void initState() {
    super.initState();

    EmailOTP.config(
      otpLength: 5,
      appName: 'MindHorizon',
      appEmail: 'mindhorizonsupport@gmail.com',
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isSent = await EmailOTP.sendOTP(email: widget.emailController);
      if (isSent && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Code was sent to your email')),
        );
      } else {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Failed to send code')));
        }
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 4) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else if (index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
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
                padding: EdgeInsets.only(
                  left:
                      MediaQuery.of(context).size.height < 896
                          ? 20.w
                          /// Тест для СЕ
                          : MediaQuery.of(context).size.height > 896
                          ? 40
                              .w // 16 pro max
                          : 40.w, // 11 iphone
                  right:
                      MediaQuery.of(context).size.height < 896
                          ? 20.w
                          /// Тест для СЕ
                          : MediaQuery.of(context).size.height > 896
                          ? 40
                              .w // 16 pro max
                          : 40.w, // 11 iphone
                  top:
                      MediaQuery.of(context).size.height < 896
                          ? 100.h
                          /// Тест для СЕ
                          : MediaQuery.of(context).size.height > 896
                          ? 200
                              .h // 16 pro max
                          : 200.h,
                ), // 11 iphone
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildRegText(
                      text: 'Check email',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alegreya',
                      color: Color(0xff455a64),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 27.0),
                      child: SizedBox(
                        child: RichText(
                          text: TextSpan(
                            text: 'We sent a reset link to ',
                            style: TextStyle(
                              color: Color(0xff455a64),
                              fontFamily: 'AlegreyaSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp,
                            ),
                            children: [
                              TextSpan(
                                text: widget.emailController,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                    ' enter 5 digit code that mentioned in the email',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return SizedBox(
                            width: 65,
                            height: 65,
                            child: TextField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xffe7c178),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              onChanged: (value) => _onOtpChanged(index, value),
                            ),
                          );
                        }),
                      ),
                    ),
                    Column(
                      children: [
                        LogAndGerBtn(
                          textBtn: 'Verify code',
                          onTap: () async {
                            if (EmailOTP.verifyOTP(
                              otp: _controllers.map((el) => el.text).join(),
                            )) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SetNewPass(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Invalid validate the code"),
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              BuildRegText(
                                text: "Haven't got the email yet?",
                                fontSize:
                                    MediaQuery.of(context).size.height < 896
                                        ? 20.sp
                                        /// Тест для СЕ
                                        : MediaQuery.of(context).size.height >
                                            896
                                        ? 20
                                            .sp // 16 pro max
                                        : 18.sp, // 11 iphone,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'AlegreyaSans',
                                color: Color(0xff5b6c72),
                              ),
                              const SizedBox(width: 5.0),
                              GestureDetector(
                                onTap: () async {
                                  await EmailOTP.sendOTP(
                                    email: widget.emailController,
                                  );
                                },

                                child: BuildRegText(
                                  text: "Resent code",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'AlegreyaSans',
                                  color: Color(0xff5b6c72),
                                ),
                              ),
                            ],
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
