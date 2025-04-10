import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Color(0xfff8ecd6),
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuildText(
                text: 'MindHorizon',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xfffea386),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xfffea386),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:
                        user?.photoURL != null
                            ? ClipOval(
                              child: Image.network(
                                user!.photoURL!,
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              ),
                            )
                            : Image.asset('assets/img/cuate.png', scale: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
