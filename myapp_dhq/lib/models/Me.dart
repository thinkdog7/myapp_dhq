import 'package:json_annotation/json_annotation.dart';
part 'Me.g.dart';
@JsonSerializable()
class Me {
  Me(this.name,this.coin,this.bio,this.aboutMe);

  String name;
  int coin;
  String bio;
  String aboutMe;

  factory Me.fromJson(Map<String,dynamic> json) => _$MeFromJson(json);
  Map<String, dynamic> toJson() => _$MeToJson(this);
}