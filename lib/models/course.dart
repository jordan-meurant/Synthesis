import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:synthesis/models/userprofile.dart';

class Course {
  final String id;
  final String name;
  //final List<Resource> resources;
  //final List<Notes> resources;
  final String imageURL;


  Course({required this.id, required this.name, required this.imageURL});

  static Course fromJson(Map<String, dynamic> json) {

    return Course(
      id: json['uid'] ?? '',
      name: json['name'] ?? '',
      imageURL: json['imageURL'] ?? ''
    );
  }

  static Course fromSnapshot(DocumentSnapshot snapshot) {

    return Course(
        id: snapshot['uid'] ?? '',
        name: snapshot['name'] ?? '',
        imageURL: snapshot['imageURL'] ?? ''
    );
  }
}
