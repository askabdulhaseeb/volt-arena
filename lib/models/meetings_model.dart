import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingsModel {
  MeetingsModel({
    this.meetingId,
    this.meetingTitle,
    this.startingTime,
    this.endingTime,
    this.isAllDay,
  });
  final String? meetingId;
  final String? meetingTitle;
  final Timestamp? startingTime;
  final Timestamp? endingTime;
  final bool? isAllDay;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'meetingId': meetingId,
      'meetingTitle': meetingTitle,
      'startingTime': startingTime,
      'endingTime': endingTime,
      'isAllDay': isAllDay,
    };
  }

  // ignore: sort_constructors_first
  factory MeetingsModel.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return MeetingsModel(
      meetingId: doc.data()!['meetingId'],
      meetingTitle: doc.data()!['meetingTitle'],
      startingTime: doc.data()!['startingTime'],
      endingTime: doc.data()!['endingTime'],
      isAllDay: doc.data()!['isAllDay'],
    );
  }
}
