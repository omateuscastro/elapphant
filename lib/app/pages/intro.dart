import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class IntroPage extends StatefulWidget {
  IntroPage();

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  Animation<int> textAnimation;
  Animation<double> buttonAnimation;
  Animation<double> opacityAnimation;
  Animation<double> blurAnimation;
  AnimationController animationController;

  int _stringIndex;
  static const List<String> _welcomeString = const <String>[
    'Discover amazing elephants from around the world!',
  ];
  String get _currentString =>
      _welcomeString[_stringIndex % _welcomeString.length];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<String> getVersionNumber() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    }

    Widget infoVersionNumber() => Positioned(
          bottom: 0,
          right: 0,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FutureBuilder(
                  future: getVersionNumber(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) =>
                          Text(
                            snapshot.hasData
                                ? "v " + snapshot.data
                                : "Carregando ...",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
            ),
          ),
        );

    Widget buttonToHome() => Positioned(
          bottom: buttonAnimation.value,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child: OutlineButton(
                  color: Colors.white,
                  disabledBorderColor: Colors.white,
                  highlightedBorderColor: Colors.white,
                  textColor: Colors.white,
                  child: Text(
                    "Find out now!",
                    style: TextStyle(fontSize: 18),
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                )),
          ),
        );

    animationController = AnimationController(
      duration: const Duration(milliseconds: 2800),
      vsync: this,
    );

    blurAnimation = Tween<double>(begin: 0.0, end: 7.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 0.4, curve: Curves.fastOutSlowIn),
    ));

    _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
    textAnimation =
        StepTween(begin: 0, end: _currentString.length).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.2, 0.8, curve: Curves.easeIn),
    ));

    buttonAnimation =
        Tween<double>(begin: 0.0, end: MediaQuery.of(context).size.height * 0.3)
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.7, 1.0, curve: Curves.ease),
    ));

    opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
    ));

    animationController.forward();

    return Scaffold(
      body: Container(
        color: Colors.indigo[900],
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Opacity(
                  opacity: 0.3,
                  child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/african_bush_elephant.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: blurAnimation.value),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        );
                      }))),
          AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.3,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: textAnimation == null
                            ? null
                            : AnimatedBuilder(
                                animation: textAnimation,
                                builder: (BuildContext context, Widget child) {
                                  String text = _currentString.substring(
                                      0, textAnimation.value);
                                  return Text(
                                    text,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.white),
                                  );
                                },
                              ),
                      ),
                      buttonToHome(),
                      infoVersionNumber(),
                    ]));
              })
        ]),
      ),
    );
  }
}
