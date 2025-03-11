import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Color(0xfff8ecd6),
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MindHorizon',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: Color(0xfffea386),
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xfffea386),
                  radius: 24,
                  child: Center(
                    child: Text(
                      '12',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xfffea386),
                    radius: 24,
                    child: Center(
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
