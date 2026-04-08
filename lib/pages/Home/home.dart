import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Gusky/pages/Form/SignUp.dart';
import 'package:Gusky/pages/Package/package.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget socialIcons() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.facebook, size: 30, color: Colors.white),
          SizedBox(height: 15),
          FaIcon(FontAwesomeIcons.twitter, size: 30, color: Colors.white),
          SizedBox(height: 15),
          FaIcon(FontAwesomeIcons.instagram, size: 30, color: Colors.white),
          SizedBox(height: 15),
          FaIcon(FontAwesomeIcons.linkedin, size: 30, color: Colors.white),
        ],
      ),
    );
  }

  Widget textWithHighlight(String text, String highlight) {
    List<TextSpan> spans = [];
    int start = 0;
    int index = text.indexOf(highlight);

    while (index != -1) {
      if (index > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, index),
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
        );
      }
      spans.add(
        TextSpan(
          text: highlight,
          style: TextStyle(
            fontSize: 48,
            fontFamily: 'Gameria',
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            color: const Color(0xFFFFC53D),
            shadows: [
              Shadow(offset: Offset(-1, -1), color: Colors.black),
              Shadow(offset: Offset(1, -1), color: Colors.black),
              Shadow(offset: Offset(1, 1), color: Colors.black),
              Shadow(offset: Offset(-1, 1), color: Colors.black),
            ],
          ),
        ),
      );

      start = index + highlight.length;
      index = text.indexOf(highlight, start);
    }

    if (start < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(start),
          style: TextStyle(color: Colors.white, fontSize: 48),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Cherry.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gusky!',
                    style: TextStyle(
                      fontFamily: 'Gevora',
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Signup()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [socialIcons()],
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Crafting',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [textWithHighlight("Journeys Not", "Journeys")],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [textWithHighlight("Just Trips", "Trips")],
                  ),
                ],
              ),
            ),

            Text(
              'Discover the world with us',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.8),
              ),
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Package()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.travel_explore, size: 20),
                  SizedBox(width: 10),
                  Text('Explore Packages',
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gevora'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
