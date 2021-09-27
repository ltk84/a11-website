import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/custom_title.dart';

class AuthenticationDialog extends StatefulWidget {
  const AuthenticationDialog({Key? key}) : super(key: key);

  @override
  _AuthenticationDialogState createState() => _AuthenticationDialogState();
}

class _AuthenticationDialogState extends State<AuthenticationDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scaleAnimation;
  late final Tween<double> blurAnimation;
  final Duration animationDuration = Duration(milliseconds: 450);

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: animationDuration);
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    blurAnimation = Tween<double>(begin: 0.1, end: 8.0);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: TweenAnimationBuilder<double>(
          tween: blurAnimation,
          duration: animationDuration,
          curve: Curves.easeIn,
          builder: (_, value, child) {
            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: value,
                sigmaY: value,
                tileMode: TileMode.repeated,
              ),
              child: child,
            );
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              height: 405,
              width: 400,
              decoration: BoxDecoration(
                color: Color(0xFFC6BFBF).withOpacity(0.75),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTitle(
                    mainAxisAlignment: MainAxisAlignment.start,
                    subtitle: 'Authentication',
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  _buildInputField('Username'),
                  SizedBox(
                    height: 14,
                  ),
                  _buildInputField('Password'),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.reverse();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFA09898),
                            onPrimary: Theme.of(context).backgroundColor,
                          ),
                          child: Text('Close'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2fbd50),
                            //onPrimary: Theme.of(context).backgroundColor,
                          ),
                          child: Text('Confirm'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            title,
          ),
        ),
        Container(
          height: 36,
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
