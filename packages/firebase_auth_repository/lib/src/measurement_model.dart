import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Measurement {
  final String docId; // Firestore 문서의 고유 ID
  final String PICId;
  final int memberId;
  final String memberName;
  final String PICName;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? userHeight;
  final double? userWeight;
  final double? smm;
  final double? bfm;
  final double? bfp;
  final int? bpm;
  final int? stage0;
  final int? stage1;
  final int? stage2;
  final int? stage3;
  final int? stage4;
  final int? stage5;
  final int? stage6;
  final int? stage7;
  final int? stage8;
  final int? bpmMax;
  final int? bpm1m;
  final int? bpm2m;
  final int? bpm3m;
  final String? branch;
  final int? exhaustionSeconds;
  final String updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? status;

  Measurement({
    required this.PICName,
    required this.docId,
    required this.PICId,
    required this.memberId,
    required this.memberName,
    required this.startDate,
    required this.endDate,
    this.userHeight,
    this.userWeight,
    this.smm,
    this.bfm,
    this.bfp,
    this.bpm,
    this.stage0,
    this.stage1,
    this.stage2,
    this.stage3,
    this.stage4,
    this.stage5,
    this.stage6,
    this.stage7,
    this.stage8,
    this.bpmMax,
    this.bpm1m,
    this.bpm2m,
    this.bpm3m,
    this.exhaustionSeconds,
    this.branch,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  Measurement copyWith({
    String? docId, // Firestore 문서의 고유 ID
    String? PICId,
    int? memberId,
    String? PICName,
    String? memberName,
    DateTime? startDate,
    DateTime? endDate,
    double? userHeight,
    double? userWeight,
    double? smm,
    double? bfm,
    double? bfp,
    int? bpm,
    int? stage0,
    int? stage1,
    int? stage2,
    int? stage3,
    int? stage4,
    int? stage5,
    int? stage6,
    int? stage7,
    int? stage8,
    int? bpmMax,
    int? bpm1m,
    int? bpm2m,
    int? bpm3m,
    String? branch,
    int? exhaustionSeconds,
    String? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? status,
  }) {
    return Measurement(
      PICName: PICName ?? this.PICName,
      docId: docId ?? this.docId,
      memberId: memberId ?? this.memberId,
      memberName: memberName ?? this.memberName,
      PICId: PICId ?? this.PICId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      userHeight: userHeight ?? this.userHeight,
      userWeight: userWeight ?? this.userWeight,
      smm: smm ?? this.smm,
      bfm: bfm ?? this.bfm,
      bfp: bfp ?? this.bfp,
      bpm: bpm ?? this.bpm,
      stage0: stage0 ?? this.stage0,
      stage1: stage1 ?? this.stage1,
      stage2: stage2 ?? this.stage2,
      stage3: stage3 ?? this.stage3,
      stage4: stage4 ?? this.stage4,
      stage5: stage5 ?? this.stage5,
      stage6: stage6 ?? this.stage6,
      stage7: stage7 ?? this.stage7,
      stage8: stage8 ?? this.stage8,
      bpmMax: bpmMax ?? this.bpmMax,
      bpm1m: bpm1m ?? this.bpm1m,
      bpm2m: bpm2m ?? this.bpm2m,
      bpm3m: bpm3m ?? this.bpm3m,
      exhaustionSeconds: exhaustionSeconds ?? this.exhaustionSeconds,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
      branch: branch ?? this.branch,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'PICName': PICName,
      'docId': docId,
      'PICId': PICId,
      'memberName': memberName,
      'endDate': Timestamp.fromDate(endDate!),
      'startDate': Timestamp.fromDate(startDate!),
      'userHeight': userHeight,
      'userWeight': userWeight,
      'smm': smm,
      'bfm': bfm,
      'bfp': bfp,
      'bpm': bpm,
      'stage0': stage0,
      'stage1': stage1,
      'stage2': stage2,
      'stage3': stage3,
      'stage4': stage4,
      'stage5': stage5,
      'stage6': stage6,
      'stage7': stage7,
      'stage8': stage8,
      'bpmMax': bpmMax,
      'bpm1m': bpm1m,
      'bpm2m': bpm2m,
      'bpm3m': bpm3m,
      'exhaustionSeconds': exhaustionSeconds,
      'updatedBy': updatedBy,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'branch': branch,
      'status': status,
      'memberId': memberId,
      // 'actions': actions,
    };
  }

  factory Measurement.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return Measurement(
      PICName: map['PICName'] ?? '',
      memberName: map['memberName'] ?? '',
      docId: doc.id,
      PICId: map['PICId'] ?? '',
      startDate: map['startDate'].toDate(),
      endDate: map['endDate'].toDate(),
      memberId: map['memberId'] ?? 0,
      userHeight: map['userHeight'],
      userWeight: map['userWeight'],
      smm: map['smm'],
      bfm: map['bfm'],
      bfp: map['bfp'],
      bpm: map['bpm'],
      stage0: map['stage0'],
      stage1: map['stage1'],
      stage2: map['stage2'],
      stage3: map['stage3'],
      stage4: map['stage4'],
      stage5: map['stage5'],
      stage6: map['stage6'],
      stage7: map['stage7'],
      stage8: map['stage8'],
      bpm3m: map['bpm3m'],
      bpm2m: map['bpm2m'],
      bpm1m: map['bpm1m'],
      bpmMax: map['bpmMax'],
      exhaustionSeconds: map['exhaustionSeconds'],
      updatedBy: map['updatedBy'] ?? '',
      createdAt: map['createdAt'].toDate(),
      updatedAt: map['updatedAt'].toDate(),
      branch: map['branch'] ?? '',
      status: map['status'] ?? '',
    );
  }

  factory Measurement.empty() => Measurement(
        PICName: '',
        memberName: '',
        docId: '',
        PICId: '',
        startDate: null,
        endDate: null,
        memberId: 0,
        userHeight: null,
        userWeight: null,
        smm: null,
        bfm: null,
        bfp: null,
        bpm: null,
        stage0: null,
        stage1: null,
        stage2: null,
        stage3: null,
        stage4: null,
        stage5: null,
        stage6: null,
        stage7: null,
        stage8: null,
        bpmMax: null,
        bpm1m: null,
        bpm2m: null,
        bpm3m: null,
        exhaustionSeconds: 0,
        updatedBy: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        branch: '동천역',
        status: '활성',
        // actions: null,
      );
}

class ExhaustionModel {
  final String month;
  final int seconds;
  final Color color;

  ExhaustionModel({
    required this.color,
    required this.month,
    required this.seconds,
  });
}

class StageModel {
  final String stage;
  final int previousValue;
  final int currentValue;

  StageModel({
    required this.stage,
    required this.previousValue,
    required this.currentValue,
  });
}

class HrrModel {
  final String hrr;
  final int previousValue;
  final int currentValue;

  HrrModel({
    required this.hrr,
    required this.previousValue,
    required this.currentValue,
  });
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.id);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  String? id;
// bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String? getNotes(int index) {
    return appointments![index].id;
  }

// @override
// bool isAllDay(int index) {
//   return appointments![index].isAllDay;
// }
}
