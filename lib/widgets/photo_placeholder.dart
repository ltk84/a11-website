import 'package:flutter/material.dart';

class PhotoPlaceholder extends StatefulWidget {
  final String photoURL;
  const PhotoPlaceholder({Key? key, required this.photoURL}) : super(key: key);

  @override
  _PhotoPlaceholderState createState() => _PhotoPlaceholderState();
}

class _PhotoPlaceholderState extends State<PhotoPlaceholder> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {},
      onHover: (hover) {
        setState(() {
          if (hover) {
            opacity = 1;
          } else {
            opacity = 0;
          }
        });
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(
                  widget.photoURL,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.transparent, Colors.transparent, Colors.black38],
                  stops: [0, 0.2, 0.75, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
