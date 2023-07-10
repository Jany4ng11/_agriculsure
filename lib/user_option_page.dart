import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'user_registration_page.dart';

class UserOptionPage extends StatelessWidget {
  UserOptionPage({Key? key}) : super(key: key);

  // Replace with your own image asset paths
  final List<String> images = [
    '../assets/images/scroll1.png',
    '../assets/images/scroll2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 400,
            child: ScrollLoopAutoScroll(
              scrollDirection: Axis.horizontal,
              duration: const Duration(seconds: 200),
              child: Row(
                children: images
                    .map((image) => Image.asset(image, fit: BoxFit.cover))
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Explore the app',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                  child: Text(
                    'Begin monitoring your crops with our tool today. This will help you spot and stop diseases early on, ensuring healthier crops and a better harvest.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const UserRegistrationPage(),
                        ),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(340, 0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle Login action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                    minimumSize: const Size(340, 0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(color: Colors.black),
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
