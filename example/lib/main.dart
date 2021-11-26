import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parallax_bg/parallax_bg.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _planetOffset = 1;
  double _meteorOffset = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: _parallaxBody()),
        ]),
      ),
    );
  }

  _parallaxBody() {
    return ParallaxBackground(
      backgroundImage: "assets/images/galaxy.jpg",
      foregroundChilds: [
        ParallaxItem(
            child: Image.asset("assets/images/galaxy.jpg"),
            offset: _planetOffset + 6),
        ParallaxItem(
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 150,
                  child: Image.asset(
                    'assets/images/wing.png',
                    scale: 2,
                  ),
                ),
              ],
            ),
            offset: _planetOffset + 4),
        ParallaxItem(
            child: Image.asset(
              "assets/images/kab.png",
              scale: 0.1,
              fit: BoxFit.fitHeight,
            ),
            offset: _planetOffset + 2),
        ParallaxItem(
            child: Stack(
              children: [
                Positioned(
                  left: -30,
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/kab_data.png",
                    scale: 1,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            offset: _planetOffset + 1),
        ParallaxItem(
            child: Stack(
              children: [
                Positioned(
                  bottom: 250,
                  left: 140,
                  child: FlipCard(
                    speed: 200,
                    flipOnTouch: true,
                    direction: FlipDirection.VERTICAL,
                    front: SizedBox(
                        child: Image.asset(
                      'assets/images/face.png',
                      alignment: Alignment.center,
                      scale: 1.1,
                    )),
                    back: SizedBox(
                        child: Image.asset(
                      'assets/images/face2.png',
                      alignment: Alignment.center,
                      scale: 1.1,
                    )),
                  ),
                ),
              ],
            ),
            offset: _planetOffset + 1.5),
        ParallaxItem(
            child: Stack(
              children: [
                Positioned(
                  bottom: 100,
                  left: 80,
                  child: FlipCard(
                    speed: 200,
                    flipOnTouch: true,
                    direction: FlipDirection.HORIZONTAL,
                    front: SizedBox(
                        child: Image.asset(
                      'assets/images/phone.png',
                      alignment: Alignment.center,
                      scale: 1.1,
                    )),
                    back: SizedBox(
                        child: Image.asset(
                      'assets/images/mail.png',
                      alignment: Alignment.center,
                      scale: 1.1,
                    )),
                  ),
                ),
              ],
            ),
            offset: _planetOffset + 1.5),
      ],
    );
  }
}
