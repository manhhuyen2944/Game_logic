// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuizUser {
  final String id;
  final String photoUrl;
  final int score;
  QuizUser({
    required this.id,
    required this.photoUrl,
    required this.score,
  });

  QuizUser copyWith({
    String? id,
    String? photoUrl,
    int? score,
  }) {
    return QuizUser(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  factory QuizUser.fromMap(Map<String, dynamic> map) {
    return QuizUser(
      id: map['id'] as String,
      photoUrl: map['photoUrl'] as String,
      score: map['score'] as int,
    );
  }
 factory QuizUser.fromQueryDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    data['id'] = id;
    return QuizUser.fromMap(data);
  }
  String toJson() => json.encode(toMap());

  factory QuizUser.fromJson(String source) => QuizUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuizUser(id: $id, photoUrl: $photoUrl, score: $score)';

  @override
  bool operator ==(covariant QuizUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.photoUrl == photoUrl &&
      other.score == score;
  }

  @override
  int get hashCode => id.hashCode ^ photoUrl.hashCode ^ score.hashCode;
}
