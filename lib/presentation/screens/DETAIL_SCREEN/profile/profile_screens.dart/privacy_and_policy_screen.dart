import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';

class PrivacyAndPolicyScreen extends StatefulWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  State<PrivacyAndPolicyScreen> createState() => _PrivacyAndPolicyScreenState();
}

class _PrivacyAndPolicyScreenState extends State<PrivacyAndPolicyScreen> {
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

          /// Основной контент
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Column(
                children: <Widget>[
                  /// Верхний заголовок и кнопка закрытия
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

                  /// Контейнер с текстом и прокруткой
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ), // Отступ для прокрутки
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildText(
                              text: 'Privacy policy',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xfffea386),
                            ),
                            _buildSectionTitle('1. Introduction'),
                            _buildSectionText(
                              'This meditation application (hereinafter referred to as the "Application") respects your privacy and strives to protect your personal data. This Privacy Policy (hereinafter referred to as the "Policy") describes what data we collect, how we use it, and what rights you have.',
                            ),
                            _buildSectionTitle('2. What Data We Collect'),
                            _buildSectionText(
                              'When using the Application, we may collect the following data:\n'
                              '- Personal information (name, email, if you create an account)\n'
                              '- Device information (model, operating system, application version)\n'
                              '- Usage data (duration of meditation sessions, user preferences)\n'
                              '- Cookies and similar technologies',
                            ),
                            _buildSectionTitle('3. How We Use the Data'),
                            _buildSectionText(
                              'The collected data is used for:\n'
                              '- Providing and improving the Application\'s functionality\n'
                              '- Customizing the user experience\n'
                              '- Sending notifications and reminders (if you have given consent)\n'
                              '- Analyzing usage and improving functionality\n'
                              '- Complying with legal requirements',
                            ),
                            _buildSectionTitle(
                              '4. Data Sharing with Third Parties',
                            ),
                            _buildSectionText(
                              'We do not share your personal data with third parties except in the following cases:\n'
                              '- If necessary for the operation of the Application (e.g., cloud data storage)\n'
                              '- If required by law\n'
                              '- If you have given your consent',
                            ),
                            _buildSectionTitle(
                              '5. Data Storage and Protection',
                            ),
                            _buildSectionText(
                              'We take all reasonable measures to protect your data from unauthorized access, modification, or deletion. Data is stored only for the period necessary to fulfill the purposes described in this Policy.',
                            ),
                            _buildSectionTitle('6. Your Rights'),
                            _buildSectionText(
                              'You have the right to:\n'
                              '- Know what data is stored about you\n'
                              '- Correct or delete your data\n'
                              '- Restrict data processing\n'
                              '- Withdraw consent for data processing (if applicable)',
                            ),
                            _buildSectionTitle('7. Contact Us'),
                            _buildSectionText(
                              'If you have any questions about this Privacy Policy, please contact us at: [Contact Information].',
                            ),
                            _buildSectionTitle('8. Changes to the Policy'),
                            _buildSectionText(
                              'We may periodically update this Policy. We will notify you of significant changes by publishing a new version in the Application.',
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
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xfffea386),
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 193, 89, 57)),
    );
  }
}
