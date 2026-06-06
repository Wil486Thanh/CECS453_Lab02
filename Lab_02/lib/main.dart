import 'package:flutter/material.dart';

void main() {
  runApp(const CardApp());
}

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Digital Art Space', home: ArtScreen());
  }
}

class CardInfo {
  final String artTitle;
  final String artAuthor;
  final String artLink;

  const CardInfo({
    required this.artTitle,
    required this.artAuthor,
    required this.artLink,
  });
}

class ArtWidget extends StatelessWidget {
  final CardInfo artInfo;

  const ArtWidget({super.key, required this.artInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // avatar image
          Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(8),
            //               border: Border.all(width: 4, color: Colors.blue),
            //             ),
            child: Image.network(this.artInfo.artLink, height: 400),
          ),

          const SizedBox(height: 100),

          // title
          Text(
            this.artInfo.artTitle,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "roboto",
              fontWeight: FontWeight.bold,
            ),
          ),

          // artist
          Text(
            textAlign: TextAlign.center,
            this.artInfo.artAuthor,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "courier",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ArtScreen extends StatefulWidget {
  const ArtScreen({super.key});

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  int _artIndex = 0;

  // ----- ARTWORK DECLARATIONS -----
  final List<CardInfo> artworkList = const [
    CardInfo(
      artLink:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Morton_Schamberg_-_%22God%22_By_Baroness_Elsa_von_Freytag-Loringhoven_and_Morton_Schamberg_-_Google_Art_Project.jpg/500px-Morton_Schamberg_-_%22God%22_By_Baroness_Elsa_von_Freytag-Loringhoven_and_Morton_Schamberg_-_Google_Art_Project.jpg',
      artTitle: 'God',
      artAuthor: 'Baroness Elsa von Freytag-Loringhoven and Morton Schamberg',
    ),
    CardInfo(
      artLink:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Marcel_Duchamp%2C_1917%2C_Fountain%2C_photograph_by_Alfred_Stieglitz.jpg/500px-Marcel_Duchamp%2C_1917%2C_Fountain%2C_photograph_by_Alfred_Stieglitz.jpg',
      artTitle: 'Fountain',
      artAuthor: 'Marcel Duchamp',
    ),
    CardInfo(
      artLink:
          'https://upload.wikimedia.org/wikipedia/en/b/b9/MagrittePipe.jpg',
      artTitle: 'La Trahison des images',
      artAuthor: 'René Magritte',
    ),
    CardInfo(
      artLink:
          'https://upload.wikimedia.org/wikipedia/en/d/df/ABCD-Hausmann.jpg?_=20240819081323',
      artTitle: 'ABCD',
      artAuthor: 'Raoul Hausmann',
    ),
    CardInfo(
      artLink:
          'https://upload.wikimedia.org/wikipedia/en/1/17/OvalConstruction-Schwitters%2C1925.jpg',
      artTitle: 'Untitled',
      artAuthor: 'Kurt Schwitters',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6495ED), Color(0xFF696969), Color(0xFF2E8B57)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArtWidget(artInfo: artworkList[_artIndex]),

              // spacer box MUY GRANDE
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _artIndex--;
                        _artIndex %= artworkList.length;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      // Background color
                      backgroundColor: Colors.blue,
                      // Button padding
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 12,
                      ),
                      // Border radius
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // Shadow
                      elevation: 4,
                    ),
                    child: const Text(
                      'Previous',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _artIndex++;
                        _artIndex %= artworkList.length;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      // Background color
                      backgroundColor: Colors.blue,
                      // Button padding
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 12,
                      ),
                      // Border radius
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // Shadow
                      elevation: 4,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
