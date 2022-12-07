import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String id;
  final String displayName;
  final String email;
  final String phoneNo;
  final String imageURL;
  final List<String> groupsId;

  UserProfile(
      {required this.id,
      required this.displayName,
      required this.email,
      required this.phoneNo,
      required this.imageURL,
      required this.groupsId});

  static UserProfile fromJson(Map<String, dynamic> json) {
    var groupsId = json['groups'] as List<String>;

    return UserProfile(
      id: json['uid'] ?? '',
      displayName: json['displayName'] ?? '',
      email: json['email'] ?? '',
      phoneNo: json['phoneNo'] ?? '',
      imageURL: json['imageURL'] ?? '',
      groupsId: groupsId ?? [],
    );
  }

  static UserProfile fromSnapshot(DocumentSnapshot snapshot) {
    var groupsId = snapshot['groups'] as List<String>;
    return UserProfile(
      id: snapshot['uid'],
      displayName: snapshot['displayName'],
      email: snapshot['email'],
      phoneNo: snapshot['phoneNo'],
      imageURL: snapshot['imageURL'],
      groupsId: groupsId ?? [],
    );
  }
}
