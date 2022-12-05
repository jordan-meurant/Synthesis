import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String id;
  final String displayName;
  final String email;
  final String phoneNo;
  final String imageURL;

  UserProfile({
    required this.id,
    required this.displayName,
    required this.email,
    required this.phoneNo,
    required this.imageURL,
  });

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['uid'] ?? '',
        displayName: json['displayName'] ?? '',
        email: json['email'] ?? '',
        phoneNo: json['phoneNo'] ?? '',
        imageURL: json['imageURL'] ?? '',
      );

  static UserProfile fromSnapshot(DocumentSnapshot snapshot) => UserProfile(
        id: snapshot['uid'],
        displayName: snapshot['displayName'],
        email: snapshot['email'],
        phoneNo: snapshot['phoneNo'],
        imageURL: snapshot['imageURL'],
      );
}
