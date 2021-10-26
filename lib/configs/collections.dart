import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:volt_arena_app/models/users.dart';

final CollectionReference<Map<String, dynamic>> userRef = FirebaseFirestore.instance.collection('users');
final CollectionReference<Map<String, dynamic>> commentsRef = FirebaseFirestore.instance.collection('comments');
final CollectionReference<Map<String, dynamic>> chatRoomRef = FirebaseFirestore.instance.collection('chatRoom');
final CollectionReference<Map<String, dynamic>> chatListRef = FirebaseFirestore.instance.collection('chatLists');
final CollectionReference<Map<String, dynamic>> calenderRef = FirebaseFirestore.instance.collection('calenderMeetings');
final CollectionReference<Map<String, dynamic>> activityFeedRef = FirebaseFirestore.instance.collection('activityFeed');

AppUserModel? currentUser;
bool? isAdmin;
