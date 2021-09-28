import 'dart:math';

import 'package:a11_website/widgets/html_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/svg_icon.dart';
import '../widgets/custom_title.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    final Size deviceSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                isWebMobile ? 'Swipe Up' : 'Scroll Down',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
              SizedBox(
                height: 8,
              ),
              Transform.rotate(
                angle: isWebMobile ? pi : 2 * pi,
                child: SvgIcon(
                  iconPath: 'assets/icons/scroll_down.svg',
                  size: 18,
                ),
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: [
            CustomTitle(
              scale: deviceSize.width < 800 ? 1.5 : 2.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                // image: DecorationImage(
                //   image: NetworkImage(
                //     'https://cors-anywhere.herokuapp.com/https://drive.google.com/uc?export=view&id=1av8Y0lbKfjbNDV8FssKlNbO9M92t4gpL',
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: HTMLImage(),
            )
          ],
          options: CarouselOptions(
            autoPlay: true,
            height: deviceSize.height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
          ),
        ),
      ],
    );
  }
}
