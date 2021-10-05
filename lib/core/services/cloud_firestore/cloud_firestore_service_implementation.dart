import 'package:a11_website/core/models/image.dart';
import 'package:a11_website/core/services/cloud_firestore/cloud_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceImpl extends FirestoreService {
  static final List<String> photoURLs = [
    'https://drive.google.com/uc?export=view&id=1Smavx4SKGsgcpeyIa88whBEPbsywgAWc',
    'https://drive.google.com/uc?export=view&id=1F0egBqsxBASkMZY5bX2U73rO2NjqXB-6',
    'https://drive.google.com/uc?export=view&id=1kl8zJ33knSfgAzwoOUKYKrh5s1j-Jiwn',
    'https://drive.google.com/uc?export=view&id=1W4aeRJSauZpSIzpC9B8ZSsVCygyf6ltZ',
    'https://drive.google.com/uc?export=view&id=1hXhtXtL5Sk-c2NFakS32cbQHEF7TVWjf',
    'https://drive.google.com/uc?export=view&id=17utftkUMicHswkyggkjb0ZmdnE6Zszuv',
  ];

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference imageColletion =
      FirebaseFirestore.instance.collection('images');
  final CollectionReference albumCollection =
      FirebaseFirestore.instance.collection('albums');

  //

  Future<List<A11Image>> getData() async {
    List<A11Image> images = [];
    await imageColletion.get().then((QuerySnapshot query) {
      query.docs.map((e) {
        A11Image image = A11Image.fromMap(e.data() as Map<String, dynamic>);
        images.add(image);
      }).toList();
    });
    return images;
  }
}

// void initFakeData() {
//   //   List<A11Image> images = [];
//   //   for (int i = 0; i < photoURLs.length; i++) {
//   //     DocumentReference docRef = imageColletion.doc();
//   //     images.add(A11Image(
//   //         id: docRef.id,
//   //         url: photoURLs[i],
//   //         authorID: 'authorID',
//   //         time: DateTime.now(),
//   //         albumID: 'albumID',
//   //         tags: []));
//   //     docRef
//   //         .set(images[i].toMap())
//   //         .then((value) => print('image added!'))
//   //         .catchError((error) => print(error));
//   //   }
//   //   print('init success');
//   //   // for (int i = 0; i < images.length; i++) {}
//   // }
