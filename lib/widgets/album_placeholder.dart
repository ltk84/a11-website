import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlbumPlaceholder extends StatefulWidget {
  final String photoURL;
  final String title;
  final String subtitle;

  const AlbumPlaceholder(
      {Key? key,
      required this.photoURL,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  _AlbumPlaceholderState createState() => _AlbumPlaceholderState();
}

class _AlbumPlaceholderState extends State<AlbumPlaceholder> {
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
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 5, 8, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _buildPhotoCover(widget.photoURL),
            _buildHoveringOverlay(opacity),
            _buildAlbumTitle(widget.title, widget.subtitle)
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoCover(String photoURL) {
    return Container(
      //margin: EdgeInsets.fromLTRB(12, 5, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            photoURL,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHoveringOverlay(double opacity) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: Container(
        //margin: EdgeInsets.fromLTRB(12, 5, 12, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
    );
  }

  Widget _buildAlbumTitle(String title, String subtitle) {
    return Container(
      width: double.maxFinite,
      //margin: EdgeInsets.fromLTRB(12, 5, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.transparent,
            Theme.of(context).primaryColor.withOpacity(0.54),
            Theme.of(context).primaryColor.withOpacity(0.87),
          ],
          stops: [0, 0.2, 0.85, 1],
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
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
