import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../pages/introduction_page.dart';
import '../widgets/svg_icon.dart';
import '../widgets/authentication_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF242424),
        backgroundColor: Colors.white,
        fontFamily: 'Lato',
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xFF242424),
            fontSize: 50,
            fontFamily: 'Lobster',
          ),
          headline2: TextStyle(
            color: Color(0xFF242424),
            fontSize: 25,
          ),
          subtitle2: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFFD1D1D1).withOpacity(0.6),
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
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              height: btnAuthSize,
              width: btnAuthSize,
              child: InkWell(
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
            Transform.scale(
              scale: 0.5,
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
          ],
        ),
      ),
      body: GestureDetector(
        // to detect swipe
        onPanUpdate: (details) {
          _onScroll(details.delta.dy * -1);
        },
        child: Listener(
          // to detect scroll
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
              _onScroll(pointerSignal.scrollDelta.dy);
            }
          },
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              IntroductionPage(),
              Container(
                color: Colors.yellow,
              ),
            ],
          ),
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
                duration: Duration(milliseconds: 400), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      } else {
        pageController
            .previousPage(
                duration: Duration(milliseconds: 400), curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      }
    }
  }
}
