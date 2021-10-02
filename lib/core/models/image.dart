import 'package:flutter/cupertino.dart';

class A11Image {
  final String id;
  final String url;
  final String authorId;
  final List<String> tags;
  final DateTime time;
  final String caption;
  final albumID;

  A11Image({
    required this.id,
    required this.url,
    required this.authorId,
    required this.time,
    required this.albumID,
    this.caption = '',
    required this.tags,
  });
}
