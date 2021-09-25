import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/svg_icon.dart';
import '../widgets/custom_title.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        CarouselSlider(
          items: [
            CustomTitle(
              scale: 2,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cors-anywhere.herokuapp.com/https://drive.google.com/uc?export=view&id=1av8Y0lbKfjbNDV8FssKlNbO9M92t4gpL',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
          options: CarouselOptions(
            autoPlay: true,
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
          ),
        ),
        Container(
          color: Colors.transparent,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Scroll down',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: 8,
              ),
              SvgIcon(
                iconPath: 'assets/icons/scroll_down.svg',
                size: 18,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
