import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8ecd6),
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: Image.asset('assets/img/flow.png')),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/img/botFlow.png'),
          ),

          /// Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: <Widget>[
                  /// Top title and close button
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BuildText(
                          text: 'MindHorizon',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xfffea386),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: CircleAvatar(
                            radius: 22.r,
                            backgroundColor: const Color(0xfffea386),
                            child: Icon(
                              Icons.close,
                              size: 30.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),

                  /// Text container with scrolling
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildText(
                              text: 'Contact Us',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xfffea386),
                            ),
                            _buildSectionTitle('1. General Inquiries'),
                            _buildSectionText(
                              'For general questions, feedback, or support, please contact us via email. We strive to respond to all inquiries within 24-48 hours.',
                            ),
                            _buildContactInfo('Email:', 'lermbudda@gmail.com'),
                            _buildSectionTitle('2. Technical Support'),
                            _buildSectionText(
                              'If you are experiencing technical difficulties with the application, please provide a detailed description of the issue, including your device information and any error messages.',
                            ),
                            _buildContactInfo('Email:', 'lermbudda@gmail.com'),
                            _buildSectionTitle('3. Business Inquiries'),
                            _buildSectionText(
                              'For partnership opportunities, media inquiries, or other business-related matters, please contact our business development team.',
                            ),
                            _buildContactInfo('Email:', 'lermbudda@gmail.com'),
                            _buildSectionTitle('4. Feedback'),
                            _buildSectionText(
                              "We value your feedback! Please let us know how we can improve your MindHorizon experience.",
                            ),
                            _buildContactInfo(
                              'Feedback Email:',
                              'lermbudda@gmail.com',
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xfffea386),
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        color: const Color.fromARGB(255, 193, 89, 57),
      ),
    );
  }

  Widget _buildContactInfo(String label, String info) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color.fromARGB(255, 193, 89, 57),
          ),
          children: [
            TextSpan(
              text: '$label ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: info),
          ],
        ),
      ),
    );
  }
}
