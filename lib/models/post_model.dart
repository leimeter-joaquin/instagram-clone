import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  /// The generated code assumes these values exist in JSON.
  final UserData user;
  final String image, location;
  final String? description;
  final int likes;
  final DateTime timestamp;
  final List<Comment> comments;

  PostModel({
    required this.user,
    required this.image,
    required this.location,
    this.description,
    required this.likes,
    required this.timestamp,
    required this.comments,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

@JsonSerializable()
class UserData {
  final String name, avatar;

  UserData({required this.name, required this.avatar});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Comment {
  final UserData user;
  final DateTime timestamp;
  final String content;

  Comment({required this.user, required this.timestamp, required this.content});

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
