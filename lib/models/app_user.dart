import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? phoneNo;
  final String? password;
  final Timestamp? createdAt;
  final String? joinedAt;
  final bool? isAdmin;
  final String? email;
  final String? androidNotificationToken;
  AppUser({
    this.id,
    this.name,
    this.imageUrl,
    this.phoneNo,
    this.password,
    this.createdAt,
    this.joinedAt,
    this.isAdmin=false,
    this.email,
    this.androidNotificationToken='',
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id!.trim(),
      'name': name!.trim(),
      'imageUrl': imageUrl!.trim(),
      'phoneNo': phoneNo!.trim(),
      'password': password!.trim(),
      'createdAt': createdAt,
      'joinedAt': joinedAt,
      'isAdmin': isAdmin,
      'email': email!.trim(),
      'androidNotificationToken': androidNotificationToken,
    };
  }

  factory AppUser.fromDocument(DocumentSnapshot<Map<String, dynamic>> docs) {
    return AppUser(
      id: docs.data()!['id'].toString(),
      name: docs.data()!['name'].toString(),
      imageUrl: docs.data()!['imageUrl'].toString(),
      phoneNo: docs.data()!['phoneNo'].toString(),
      password: docs.data()!['password'].toString(),
      joinedAt: docs.data()!['joinedAt'].toString(),
      isAdmin: bool.fromEnvironment(docs.data()!['isAdmin'].toString()),
      email: docs.data()!['email'].toString(),
      androidNotificationToken: docs.data()!['androidNotificationToken'].toString(),
    );
  }
}
