import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/domain/auth/auth_service.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/profile/detail_profile_screen.dart';
import 'package:mind_horizon/presentation/screens/LOGIN/login_screen.dart';
import 'package:mind_horizon/presentation/screens/REGISTER/register_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() {
    user = AuthService().getCurrentUser();
    setState(() {});
  }

  Future<void> _logout() async {
    await AuthService().logout();
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  Future<void> _deleteAccount() async {
    await AuthService().deleteUser().then((_) {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset('assets/img/botFlow.png'),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: 240.h,
              decoration: BoxDecoration(
                color: const Color(0xfffbe7c3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300.w, 25.h),
                  bottomRight: Radius.elliptical(300.w, 25.h),
                ),
              ),
            ),
          ),
          Positioned(
            top: 74.sp,
            left: 25.w,
            child: BuildText(
              text: 'MindHorizon',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xfffea386),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: const BoxDecoration(
                        color: Color(0xfffea386),
                        shape: BoxShape.circle,
                      ),
                      child:
                          user?.photoURL != null
                              ? ClipOval(
                                child: Image.network(
                                  user!.photoURL!,
                                  fit: BoxFit.cover,
                                ),
                              )
                              : Image.asset('assets/img/cuate.png'),
                    ),
                  ),
                  BuildText(
                    text: user?.displayName ?? 'User',
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xfff19584),
                  ),
                  BuildText(
                    text: user?.email ?? 'user@gmail.com',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xfff19584),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 32.h, bottom: 16.h),
                          child: _buildMenuContainer([
                            _buildMenuItem(
                              Icons.manage_accounts_outlined,
                              'Edit profile information',
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => DetailProfileScreen(index: 0),
                                  ),
                                );
                              },
                            ),
                            _buildMenuItem(
                              Icons.notifications_outlined,
                              'Notifications',
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => DetailProfileScreen(index: 1),
                                  ),
                                );
                              },
                            ),
                            _buildMenuItem(Icons.exit_to_app, 'Exit', () {
                              _showDialog(
                                'Exit',
                                'Are you sure you want to sign out?',
                                _logout,
                              );
                            }),
                            _buildMenuItem(
                              Icons.delete_outline,
                              'Delete Account',
                              () {
                                _showDialog(
                                  'Delete',
                                  'Are you sure you want to delete your account?',
                                  _deleteAccount,
                                );
                              },
                            ),
                          ]),
                        ),
                        SizedBox(height: 5.h),
                        _buildMenuContainer([
                          _buildMenuItem(
                            Icons.help_outline,
                            'Help & Support',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailProfileScreen(index: 2),
                                ),
                              );
                            },
                          ),
                          _buildMenuItem(
                            Icons.mark_email_read_outlined,
                            'Contact us',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailProfileScreen(index: 3),
                                ),
                              );
                            },
                          ),
                          _buildMenuItem(
                            Icons.lock_clock_outlined,
                            'Privacy policy',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailProfileScreen(index: 4),
                                ),
                              );
                            },
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuContainer(List<Widget> children) {
    return Container(
      width: double.infinity,
      height: 160.h,
      decoration: BoxDecoration(
        color: const Color(0xfffbe7c3),
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            offset: Offset(10.w, 20.h),
            blurRadius: 10.r,
            spreadRadius: 1.w,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(icon, color: const Color(0xfff19584)),
          SizedBox(width: 8.w),
          Text(text, style: TextStyle(color: const Color(0xfff19584))),
        ],
      ),
    );
  }

  void _showDialog(String title, String content, VoidCallback onYes) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onYes();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
    );
  }
}
