import 'package:a11_website/core/models/image.dart';
import 'package:a11_website/core/services/cloud_firestore/cloud_firestore_service.dart';
import 'package:a11_website/core/services/cloud_firestore/cloud_firestore_service_implementation.dart';
import 'package:a11_website/core/services/service_locator.dart';
import 'package:flutter/cupertino.dart';

class PhotosViewModel extends ChangeNotifier {
  FirestoreService _firestoreService = serviceLocator.get<FirestoreService>();

  List<A11Image> _images = [];

  void getData() async {
    _images = _firestoreService.getData();
    notifyListeners();
  }

  List<A11Image> get images {
    // print(images.length);
    return _images;
  }
}
