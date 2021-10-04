import 'package:a11_website/core/models/album.dart';
import 'package:a11_website/core/services/cloud_firestore/cloud_firestore_service_implementation.dart';
import 'package:flutter/cupertino.dart';

class AlbumsViewModel extends ChangeNotifier {
  FirestoreServiceImpl _firestoreService = FirestoreServiceImpl();
  List<Album> albums = [];

  void loadAlbums() async {
    // albums = _firestoreService.getData();
    notifyListeners();
  }
}
