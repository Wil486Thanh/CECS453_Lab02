// Forked from teammate James Glendinning
// Large credit to James for most of the below code.

import 'package:flutter/material.dart';

void main() {
  runApp(const CardApp());
}

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Business Card', home: CardScreen());
  }
}

class CardInfo {
  final String fullName;
  final String title;
  final String phoneNumber;
  final String socialHandle;
  final String email;

  const CardInfo({
    required this.fullName,
    required this.title,
    required this.phoneNumber,
    required this.socialHandle,
    required this.email,
  });
}

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  // was it overkill to make an entire class for this? maybe lol
  // anyway fill out all the stuff in here and you should be good to go
  final CardInfo info = const CardInfo(
    fullName: 'Angels Angelos',
    title: '''Amatuer Software Programmer
    Aspiring Game Dev''',
    phoneNumber: '123-456-7890',
    socialHandle: '@WilNgu486',
    email: 'real@gmail.com',
    // assets\images is already in pubspec.yaml (see lines 61-62)
    // so just download the image you want to use in there and point to it here
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // if you want to change the gradient colors, either use Colors.colorname
          // or just use the hexcode, but add 0xFF before it
          colors: [Color(0xFF6495ED), Color(0xFF696969), Color(0xFF2E8B57)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        // if you don't want the gradient, comment out the next line
        // if you want one solid color, just switch out Colors.transparent
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // avatar image
              CircleAvatar(
                // This will take the image in the repo instead of needing 
                backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/Wil486Thanh/CECS453_Lab01/refs/heads/main/wallpaper.jpg',
                ),
                radius: 150,
              ),

              const SizedBox(height: 200),

              // full name
              Text(
                info.fullName,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),

              // title
              Text(
                textAlign: TextAlign.center,
                info.title,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "courier",
                  fontWeight: FontWeight.bold,
                ),
              ),

              // spacer box MUY GRANDE
              const SizedBox(height: 50),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  MaterialButton(
                    onPressed: () {
                      // 
                    },
                    color: Colors.blue,
                    minWidth: 150,
                    child: const Text('Previous',
                                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  MaterialButton(
                    onPressed: () {
                      // 
                    },
                    color: Colors.blue,
                    minWidth: 150,
                    child: const Text('Next',
                                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
