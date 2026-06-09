import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Affirmations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const HomePage(title: 'Affirmations!'),
    );
  }
}

class AffirmationCard extends StatelessWidget {
  const AffirmationCard({super.key, required this.content});
  final AffirmationContent content;

  @override
  Widget build(BuildContext context) {
    return Card(
      // clips the image on the top to give it rounded corners
      clipBehavior: .antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: .center,
        children: [
          Container(
            child: Image.network(
              this.content.imageLink,
              // keeps a 16:9 aspect ratio
              // (mostly because I'm using a screenshot from a TV show for testing)
              width: 480,
              height: 270,
            ),
          ),
          Container(
            // makes the text not butt directly up to the top or bottom of the card
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text(this.content.text),
          ),
        ],
      ),
    );
  }
}

class AffirmationContent {
  final String text;
  final String imageLink;

  const AffirmationContent({required this.text, required this.imageLink});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            AffirmationCard(
              content: AffirmationContent(
                // this is a Severance reference lol
                text: "Your outie is fond of music and owns many records",
                imageLink:
                    "https://framerusercontent.com/images/qwyTm0UBagGR7tWCWQUiaHLg.webp?width=1600&height=900",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
