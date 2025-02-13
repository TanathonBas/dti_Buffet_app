import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 45.0,
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: 45.0,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'แอปพลิเคชันหมูกระทะ\nเพื่อคนไทย\nโดยเด็กไทย\nสนใจแอปพลิเคชันติดต่อ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () {
                _makePhoneCall('1112');
              },
              child: Image.asset(
                'assets/images/sauqr.png',
                width: MediaQuery.of(context).size.width * 0.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
