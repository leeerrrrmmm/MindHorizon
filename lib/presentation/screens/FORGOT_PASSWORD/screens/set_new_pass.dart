import 'package:flutter/material.dart';
import 'package:mind_horizon/components/log_and_ger_btn.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/LOGIN/login_screen.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/widgets/build_reg_text.dart';

class SetNewPass extends StatefulWidget {
  const SetNewPass({super.key});

  @override
  State<SetNewPass> createState() => _SetNewPassState();
}

class _SetNewPassState extends State<SetNewPass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> setNewPass(String pass, String confirmPass) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await AuthService().resetUserPassword(pass, confirmPass);

      if (mounted) {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
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
          Positioned(top: 0, child: Image.asset('assets/img/reglogtop.png')),
          Positioned(bottom: 0, child: Image.asset('assets/img/reglogbot.png')),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 200.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuildRegText(
                    text: 'Set a new password',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alegreya',
                    color: Color(0xff455a64),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 27.0),
                    child: SizedBox(
                      width: 370,
                      child: BuildRegText(
                        text:
                            'Create a new password. Ensure it differs from previous ones for security',
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'AlegreyaSans',
                        color: Color(0xff455a64),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Enter a password';
                              }
                              if (val.length < 6) {
                                return 'Password must contain at least 6 characters';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Enter a password';
                                }
                                if (val.length < 6) {
                                  return 'Password must contain at least 6 characters';
                                }
                                if (val != _passwordController.text) {
                                  return 'Password does not match';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
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
                        textBtn: 'Confirm',
                        onTap:
                            () => setNewPass(
                              _passwordController.text,
                              _confirmPasswordController.text,
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
