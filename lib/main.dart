import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../pages/introduction_page.dart';
import '../widgets/svg_icon.dart';
import '../widgets/authentication_dialog.dart';
import '../pages/content_page/content_page.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF242424),
        backgroundColor: Colors.white,
        hintColor: Color(0xFFD1D1D1).withOpacity(0.6),
        fontFamily: 'Lato',
        textTheme: TextTheme(
          headline1: TextStyle(
            //color: Color(0xFF242424),
            fontSize: 50,
            fontFamily: 'Lobster',
          ),
          headline2: TextStyle(
            //color: Color(0xFF242424),
            fontSize: 25,
          ),
          subtitle2: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            //color: Color(0xFFD1D1D1).withOpacity(0.6),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  bool darkMode = false;
  double btnAuthSize = 25;
  bool pageIsScrolling = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Authentication Button
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              height: btnAuthSize,
              width: btnAuthSize,
              child: InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  showDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return AuthenticationDialog();
                    },
                  );
                },
                onHover: (value) {
                  setState(() {
                    btnAuthSize = value ? 30 : 25;
                  });
                },
                child: SvgIcon(
                  iconPath: "assets/icons/auth.svg",
                  size: btnAuthSize,
                ),
              ),
            ),
            // #

            // Dark mode Switch.
            Transform.scale(
              scale: 0.5,
              child: InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() {
                    darkMode = !darkMode;
                  });
                },
                child: FlutterSwitch(
                  value: darkMode,
                  onToggle: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            // #
          ],
        ),
      ),
      body: Listener(
        // to detect scroll
        onPointerSignal: (pointerSignal) {
          if (pageController.page == 0) {
            if (pointerSignal is PointerScrollEvent) {
              _onScroll(pointerSignal.scrollDelta.dy);
            }
          }
        },
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: pageController,
          physics: isWebMobile
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          children: [
            IntroductionPage(),
            ContentPage(
              onScroll: _onScroll,
            ),
          ],
        ),
      ),
    );
  }

  void _onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        pageController
            .nextPage(
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      } else {
        pageController
            .previousPage(
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      }
    }
  }
}
