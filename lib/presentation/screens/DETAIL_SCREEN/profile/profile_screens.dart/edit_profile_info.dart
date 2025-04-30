import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/components/custom_button.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/PROFILE/profile_screen.dart';

class EditProfileInfo extends StatefulWidget {
  const EditProfileInfo({super.key});

  @override
  State<EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final user = AuthService().getCurrentUser();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _editProfile(String name, String email) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await AuthService().editProfile(name, email);

      if (mounted) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
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
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: Image.asset('assets/img/flow.png')),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/img/botFlow.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 66.h, // Адаптивное значение для отступа сверху
              left: 16.w, // Адаптивный отступ слева
              right: 16.w, // Адаптивный отступ справа
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BuildText(
                  text: 'MindHorizon',
                  fontSize: 20.sp, // Использование адаптивного шрифта
                  fontWeight: FontWeight.w700,
                  color: Color(0xfffea386),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 22.r, // Радиус с адаптивным значением
                    backgroundColor: Color(0xfffea386),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 30.sp,
                        color: Colors.white,
                      ), // Адаптивный размер иконки
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BuildText(
                  text: 'Edit Profile',
                  fontSize: 24.sp, // Адаптивный размер шрифта
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffea386),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: 32.w, // Адаптивный отступ слева
                    right: 32.w, // Адаптивный отступ справа
                    top: 10.h, // Адаптивный отступ сверху
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full name
                        TextFormField(
                          controller: _nameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter a name';
                            }
                            if (val.length < 4) {
                              return 'This field must contain at least 4 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Full name',
                            labelStyle: TextStyle(
                              color: Color(0xfffea386),
                              fontSize: 14.sp, // Адаптивный размер шрифта
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: Color(0xfffbe7c3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ), // Адаптивный радиус
                              borderSide: BorderSide(color: Color(0xfffea386)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: Color(0xfffea386)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Color(0xfffea386),
                                width: 2.w, // Адаптивная ширина границы
                              ),
                            ),
                            hintText: user?.displayName ?? 'User',
                            hintStyle: TextStyle(
                              color: Color(0xfffea386),
                              fontSize: 18.sp, // Адаптивный размер шрифта
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        // EMAIL
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.h,
                          ), // Адаптивный вертикальный отступ
                          child: TextFormField(
                            controller: _emailController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Enter your email';
                              }
                              final emailRegex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                              );
                              if (!emailRegex.hasMatch(val)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Color(0xfffea386),
                                fontSize: 14.sp, // Адаптивный размер шрифта
                                fontWeight: FontWeight.w400,
                              ),
                              filled: true,
                              fillColor: Color(0xfffbe7c3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ), // Адаптивный радиус
                                borderSide: BorderSide(
                                  color: Color(0xfffea386),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Color(0xfffea386),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Color(0xfffea386),
                                  width: 2.w, // Адаптивная ширина границы
                                ),
                              ),
                              hintText: user?.email ?? 'user@gmail.com',
                              hintStyle: TextStyle(
                                color: Color(0xfffea386),
                                fontSize: 18.sp, // Адаптивный размер шрифта
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        // Confirm BUTTON
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                          ), // Адаптивный отступ сверху
                          child: CustomButton(
                            textBtn: 'SUBMIT',
                            onTap:
                                () => _editProfile(
                                  _nameController.text,
                                  _emailController.text,
                                ),
                            color: Color(0xfffea386),
                            fontSize: 18.sp, // Адаптивный размер шрифта
                            fontWeight: FontWeight.w600,
                            height: 50.h, // Адаптивная высота кнопки
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
