import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_option_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Scan Your Crops',
      'description':
          'Simply take a photo of your crop and let the app diagnose its condition and health.',
      'image': 'assets/images/Heathy.png',
    },
    {
      'title': 'Follow Treatment Plan',
      'description':
          'The app will generate a personalized treatment plan, providing guidance on effective plant care, exclusively when the crop is diagnosed with a disease.',
      'image': 'assets/images/treatment.png',
    },
    {
      'title': 'Monitor Analytics',
      'description':
          'You can track and monitor the analytics displaying the historical health status of your crop.',
      'image': 'assets/images/analytics.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _currentPage--;
                        _controller.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.black,
                    ),
                  ),
                if (_currentPage == 0)
                  Expanded(
                    child: Container(), // Empty container to maintain alignment
                  ),
                if (_currentPage == 0)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserOptionPage()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                if (_currentPage > 0)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserOptionPage()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) => buildPage(_pages[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDots(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_currentPage < _pages.length - 1) {
                        _currentPage++;
                        _controller.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserOptionPage()),
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side: const BorderSide(color: Colors.black, width: 1.0),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.black, 
                      fontFamily: 'Poppins',
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

Widget buildPage(Map<String, String> page) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 400, // Adjust the height of the SizedBox as needed
          child: Image.asset(
            page['image']!,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          page['title']!,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          page['description']!,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}


  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align dots to the left
      children: List.generate(
        _pages.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              _currentPage = index;
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            width: _currentPage == index ? 20 : 10,
            height: _currentPage == index ? 20 : 10,
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.black : Colors.transparent,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
