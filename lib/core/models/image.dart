class A11Image {
  final String id;
  final String url;
  final String authorID;
  final List<String> tags;
  final DateTime time;
  final String caption;
  final albumID;

  A11Image({
    required this.id,
    required this.url,
    required this.authorID,
    required this.time,
    required this.albumID,
    this.caption = '',
    required this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'authorID': authorID,
      'tags': tags,
      'time': time.millisecondsSinceEpoch,
      'caption': caption,
    };
  }

  factory A11Image.fromMap(Map<String, dynamic> map) {
    return A11Image(
      id: map['id'],
      url: map['url'],
      authorID: map['authorID'],
      tags: List<String>.from(map['tags']),
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      caption: map['caption'],
      albumID: map['albumID'],
    );
  }
}
