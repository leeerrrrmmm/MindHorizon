import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/components/custom_button.dart';

class EditProfileInfo extends StatelessWidget {
  const EditProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: Image.asset('asset/img/flow.png')),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('asset/img/botFlow.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.07,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BuildText(
                  text: 'MindHorizon',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xfffea386),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xfffea386),
                    child: Center(
                      child: Icon(Icons.close, size: 30, color: Colors.white),
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
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffea386),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 49.0,
                    right: 49.0,
                    top: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full name
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                          color: Color(0xfffbe7c3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xfffea386)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BuildText(
                              text: 'Full name',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffea386),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Lerm Top',
                                  hintStyle: TextStyle(
                                    color: Color(0xfffea386),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // EMAIL
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                            color: Color(0xfffbe7c3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xfffea386)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              BuildText(
                                text: 'Email address',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfffea386),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'lermtop@gmail.com',
                                    hintStyle: TextStyle(
                                      color: Color(0xfffea386),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // MALE / FEMALE
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                          color: Color(0xfffbe7c3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xfffea386)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BuildText(
                              text: 'Genre',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffea386),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Male',
                                  hintStyle: TextStyle(
                                    color: Color(0xfffea386),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Confirm BUTTON
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CustomButton(
                          textBtn: 'SUBMIT',
                          onTap: () {},
                          color: Color(0xfffea386),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                      ),
                    ],
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
