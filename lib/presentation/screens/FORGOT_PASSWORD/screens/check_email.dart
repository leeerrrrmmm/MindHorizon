import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
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
      if (isSent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Code was sent to your email')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to send code')));
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
      body: Stack(
        children: [
          Positioned(top: 0, child: Image.asset('assets/img/reglogtop.png')),
          Positioned(bottom: 0, child: Image.asset('assets/img/reglogbot.png')),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 200.0),
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
                      width: 370,
                      child: BuildRegText(
                        text:
                            'We sent a reset link to ${widget.emailController}, enter the 5 digit code mentioned in the email',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'AlegreyaSans',
                        color: Color(0xff455a64),
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
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'AlegreyaSans',
                              color: Color(0xff5b6c72),
                            ),
                            const SizedBox(width: 5.0),
                            GestureDetector(
                              onTap: () async {
                                // RESET EMAIL LOGIC
                                if (await EmailOTP.sendOTP(
                                  email: widget.emailController,
                                )) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("OTP has been sent"),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("OTP failed sent"),
                                    ),
                                  );
                                }
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
    );
  }
}
