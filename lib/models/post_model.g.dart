// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String,
      description: json['description'] as String?,
      likes: json['likes'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'user': instance.user,
      'images': instance.images,
      'location': instance.location,
      'description': instance.description,
      'likes': instance.likes,
      'timestamp': instance.timestamp.toIso8601String(),
      'comments': instance.comments,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      name: json['name'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
      timestamp: DateTime.parse(json['timestamp'] as String),
      content: json['content'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'user': instance.user,
      'timestamp': instance.timestamp.toIso8601String(),
      'content': instance.content,
    };
