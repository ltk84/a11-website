import 'package:a11_website/core/models/image.dart';
import 'package:a11_website/core/services/cloud_firestore/cloud_firestore_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceImpl extends FirestoreService {
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final List<String> photoURLs = [
    'https://drive.google.com/uc?export=view&id=1Smavx4SKGsgcpeyIa88whBEPbsywgAWc',
    'https://drive.google.com/uc?export=view&id=1F0egBqsxBASkMZY5bX2U73rO2NjqXB-6',
    'https://drive.google.com/uc?export=view&id=1kl8zJ33knSfgAzwoOUKYKrh5s1j-Jiwn',
    'https://drive.google.com/uc?export=view&id=1W4aeRJSauZpSIzpC9B8ZSsVCygyf6ltZ',
    'https://drive.google.com/uc?export=view&id=1hXhtXtL5Sk-c2NFakS32cbQHEF7TVWjf',
    'https://drive.google.com/uc?export=view&id=17utftkUMicHswkyggkjb0ZmdnE6Zszuv',
  ];

  getData() {
    List<A11Image> images = [];
    for (var url in photoURLs) {
      images.add(A11Image(
          id: 'id',
          url: url,
          authorID: 'authorID',
          time: DateTime.now(),
          albumID: 'albumID',
          tags: []));
    }
    return images;
  }
}

// [
//       A11Image(
//           id: 'id',
//           url: photoURLs[0],
//           authorID: 'authorID',
//           time: DateTime.now(),
//           albumID: 'albumID',
//           tags: [])
//     ];
