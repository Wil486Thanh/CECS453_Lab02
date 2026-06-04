import 'package:flutter/material.dart';

void main() {
  runApp(const CardApp());
}

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Art Space', 
      home: CardScreen(),
    );
  }
}


class CardInfo {
  final String artTitle;
  final String artAuthor;
  
  const CardInfo({
    required this.artTitle,
    required this.artAuthor,
  });
}

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  final CardInfo info = const CardInfo(
    artTitle: 'BlaBlaBla',
    artAuthor: 'BlaBlaBla',
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
                info.artTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),

              // title
              Text(
                textAlign: TextAlign.center,
                info.artAuthor,
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
                  
                  ElevatedButton(
                    onPressed: () {
                      // 
                    },
                    style: ElevatedButton.styleFrom(
                      // Background color
                      backgroundColor: Colors.blue,
                      // Button padding
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                      // Border radius
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // Shadow
                      elevation: 4,
                    ),
                    child: const Text(
                      'Previous',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Hi');
                    },
                    style: ElevatedButton.styleFrom(
                      // Background color
                      backgroundColor: Colors.blue,
                      // Button padding
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                      // Border radius
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // Shadow
                      elevation: 4,
                    ),
                    child: const Text(
                      'Next',
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
