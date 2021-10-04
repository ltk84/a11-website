// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:a11_website/core/models/image.dart';

abstract class FirestoreService {
  List<A11Image> getData();
}
