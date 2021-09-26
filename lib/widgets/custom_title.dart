import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final double scale;
  final MainAxisAlignment mainAxisAlignment;

  const CustomTitle({
    Key? key,
    this.title = 'A11',
    this.subtitle = 'We only live once',
    this.scale = 1,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headline2!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
