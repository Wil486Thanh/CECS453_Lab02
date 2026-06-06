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

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CardScreen> {
  int _counter = 0;
  var imagePath = "https://raw.githubusercontent.com/Wil486Thanh/CECS453_Lab02/refs/heads/main/art/art_01.png";

  final CardInfo info = const CardInfo(
    artTitle: 'BlaBlaBla',
    artAuthor: 'BlaBlaBla',
  );

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_counter == 1) {
      imagePath = "https://raw.githubusercontent.com/Wil486Thanh/CECS453_Lab02/refs/heads/main/art/art_02.jpg";
    };
    if (_counter == 2) {
      imagePath = "https://raw.githubusercontent.com/Wil486Thanh/CECS453_Lab02/refs/heads/main/art/art_01.png";
    };
    if (_counter == 3) {
      imagePath = "https://raw.githubusercontent.com/Wil486Thanh/CECS453_Lab02/refs/heads/main/art/art_02.jpg";
    };
    
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
                backgroundImage: NetworkImage(imagePath,
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
              Text("$_counter"),

              // spacer box MUY GRANDE
              const SizedBox(height: 50),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  ElevatedButton(
                    onPressed: _decrementCounter,
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
                    onPressed: _incrementCounter,
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
