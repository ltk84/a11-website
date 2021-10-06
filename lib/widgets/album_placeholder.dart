import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlbumPlaceholder extends StatefulWidget {
  final String photoURL;
  final String title;
  final String subtitle;

  const AlbumPlaceholder({Key? key, required this.photoURL, required this.title, required this.subtitle}) : super(key: key);

  @override
  _AlbumPlaceholderState createState() => _AlbumPlaceholderState();
}

class _AlbumPlaceholderState extends State<AlbumPlaceholder> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
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
        child: Column(
          children: [
            _buildPhotoSection(widget.photoURL, opacity, constraints.maxHeight * 0.80),
            _buildDescriptionSection(widget.title, widget.subtitle, constraints.maxHeight * 0.12)
          ],
        ),
      );
    });
  }

  Widget _buildPhotoSection(String photoURL, double opacity, double height) {
    return Container(
      height: height,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(12, 5, 12, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color: Colors.grey,
              image: DecorationImage(
                image: CachedNetworkImageProvider(
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
              margin: EdgeInsets.fromLTRB(12, 5, 12, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black38
                  ],
                  stops: [0, 0.2, 0.75, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(String title, String subtitle, double height) {
    return Container(
      height: height,
      width: double.maxFinite,
      margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
        color: Theme.of(context).primaryColor,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: double.maxFinite,
              padding: EdgeInsets.only(top: 8),
              child: FittedBox(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: double.maxFinite,
              padding: EdgeInsets.only(bottom: 8),
              child: FittedBox(
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context)
                        .backgroundColor
                        .withOpacity(0.54),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
