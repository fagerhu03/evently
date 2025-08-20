import 'package:evently/screens/register/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "/onbording";

  const OnboardingScreen({super.key});

  Widget _buildImage(String index) {
    return Image.asset('assets/images/onboreding/welcom_$index.png');
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5669FF),
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFFF2FEFF),
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
    );

    return IntroductionScreen(
      globalHeader: Image.asset("assets/images/logo_h.png"),
      globalBackgroundColor: Color(0xFFF2FEFF),
      allowImplicitScrolling: true,
      infiniteAutoScroll: false,
      pages: [
        PageViewModel(
          title: "Find Events That Inspire You",
          body: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
          image: _buildImage('1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Effortless Event Planning",
          body: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
          image: _buildImage('2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Connect with Friends & Share Moments",
          body: "RMake every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
          image: _buildImage('3'),
          decoration: pageDecoration,
        ),
      ],
      showDoneButton: true,
      onDone: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      done: Text(
        "Finish",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF5669FF),

      ),
      ),
      showNextButton: true,
      next: Text(
        "Next",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF5669FF),
        ),
      ),
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF5669FF),
        ),
      ),
      onSkip: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      // You can override onSkip callback
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          fontFamily: "janna",
          color: Color(0xFF5669FF),
        ),      ),
      skipOrBackFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor:Color(0xFF5669FF),
        color: Colors.black,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xFFF2FEFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
