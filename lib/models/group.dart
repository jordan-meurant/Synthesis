import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:synthesis/models/userprofile.dart';

class Group {
  final String id;
  final String name;
  // List<Course> courses;
  List<UserProfile> participants;

  Group({required this.id, required this.name, required this.participants});

  static Group fromJson(Map<String, dynamic> json) {
    var tagParticipants = json['participants'] as List;
    List<UserProfile> participants = tagParticipants
        .map((tagJson) => UserProfile.fromJson(tagJson))
        .toList();

    return Group(
      id: json['uid'] ?? '',
      name: json['name'] ?? '',
      participants: participants ?? [],
    );
  }

  static Group fromSnapshot(DocumentSnapshot snapshot) {
    var tagParticipants = snapshot['participants'] as List;
    List<UserProfile> participants = tagParticipants
        .map((tagJson) => UserProfile.fromJson(tagJson))
        .toList();

    return Group(
      id: snapshot['uid'] ?? '',
      name: snapshot['name'] ?? '',
      participants: participants ?? [],
    );
  }
}
