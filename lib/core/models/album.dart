class Album {
  final String id;
  final String name;
  final List<String> imageIDs;

  Album({
    required this.id,
    required this.name,
    required this.imageIDs,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageIDs': imageIDs,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'],
      name: map['name'],
      imageIDs: List<String>.from(map['imageIDs']),
    );
  }
}
