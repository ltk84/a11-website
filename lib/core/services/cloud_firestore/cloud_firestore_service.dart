// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:a11_website/core/models/image.dart';

abstract class FirestoreService {
  // void initFakeData();
  Future<List<A11Image>> getData();
}
