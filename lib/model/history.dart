// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class History {
  final String username;
  final int score;
  final DateTime date;
  History({
    required this.username,
    required this.score,
    required this.date,
  });

  History copyWith({
    String? username,
    int? score,
    DateTime? date,
  }) {
    return History(
      username: username ?? this.username,
      score: score ?? this.score,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'score': score,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      username: map['username'] as String,
      score: map['score'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'History(username: $username, score: $score, date: $date)';

  @override
  bool operator ==(covariant History other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.score == score &&
        other.date == date;
  }

  @override
  int get hashCode => username.hashCode ^ score.hashCode ^ date.hashCode;
}
