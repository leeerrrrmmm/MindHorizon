import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8ecd6),
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: Image.asset('asset/img/flow.png')),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('asset/img/botFlow.png'),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
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
                            child: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildText(
                              text: 'Help & Support',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xfffea386),
                            ),
                            _buildSectionTitle('Welcome to Help & Support!'),
                            _buildSectionText(
                              'We are here to ensure you have the best experience possible. Below, you’ll find answers to common questions and ways to reach us if you need further assistance.',
                            ),
                            _buildSectionTitle('1. General Information'),
                            _buildSectionText(
                              'Our meditation app is completely free to use, with no in-app purchases or subscriptions. You can access all meditation sessions, features, and tools at no cost.',
                            ),
                            _buildSectionTitle(
                              '2. Frequently Asked Questions (FAQ)',
                            ),
                            _buildSectionText(
                              'Q: Do I need an account to use the app?',
                            ),
                            _buildSectionText(
                              'A: No, you can use the app without creating an account. However, creating an account allows you to save progress and track meditation history.',
                            ),
                            _buildSectionText('Q: Can I use the app offline?'),
                            _buildSectionText(
                              'A: Yes, some meditation sessions are available for offline use. Please check the settings to download sessions for offline listening.',
                            ),
                            _buildSectionText(
                              'Q: How can I change the app’s settings?',
                            ),
                            _buildSectionText(
                              'A: You can adjust settings such as notifications, background sounds, and session preferences in the Settings menu.',
                            ),
                            _buildSectionText('Q: Is my data safe?'),
                            _buildSectionText(
                              'A: Yes, we do not collect or share personal data beyond what is necessary for the app to function. Please refer to our Privacy Policy for more details.',
                            ),
                            _buildSectionTitle('3. Contact Us'),
                            _buildSectionText(
                              'If you need further support, feel free to reach out to us:',
                            ),
                            _buildSectionText(
                              'Email: [mychko.mychko@gmail.com]',
                            ),
                            _buildSectionText('Website: [will be coming soon]'),
                            _buildSectionText(
                              'We’re happy to assist you and improve your meditation journey!',
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
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xfffea386),
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 193, 89, 57),
        ),
      ),
    );
  }
}
