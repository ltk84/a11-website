import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class HTMLImage extends StatelessWidget {
  const HTMLImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final IFrameElement _element = IFrameElement();
    // _element.src =
    //     'https://drive.google.com/uc?export=view&id=16PKN86B8OpIY16ePE2qW_t46XYn9aG7e';

    // //ignore: undefined_prefixed_name
    // ui.platformViewRegistry.registerViewFactory(
    //   'iframeElement',
    //   (int viewId) => _element,
    // );

    // Widget _iframeWidget;
    // _iframeWidget = HtmlElementView(
    //   viewType: 'iframeElement',
    // );

    // return _iframeWidget;

    String imageUrl =
        "https://drive.google.com/uc?export=view&id=1av8Y0lbKfjbNDV8FssKlNbO9M92t4gpL";
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}
