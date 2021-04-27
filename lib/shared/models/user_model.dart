import 'dart:convert';

class UserModel {
  final String name;
  final String photoURL;
  final int score;

  UserModel({
    required this.name, 
    required this.photoURL, 
    required this.score
  });




  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoURL': photoURL,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoURL: map['photoUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
