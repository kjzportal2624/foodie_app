import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String userId;

  final String name;

  final String email;

  final String course;

  final String school;

  final String createdAt;

  final String updatedAt;

  User(
    this.userId,
    this.name,
    this.email,
    this.course,
    this.school,
    this.createdAt,
    this.updatedAt,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
