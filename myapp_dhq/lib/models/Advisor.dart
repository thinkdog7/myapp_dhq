import 'package:json_annotation/json_annotation.dart';
import "Service.dart";
part 'Advisor.g.dart';

@JsonSerializable()
class Advisor {
  Advisor(this.advisor_avatar,this.advisor_desc,this.services,this.advisor_name,this.advisor_id);

   String advisor_id;
   String advisor_name;
   String advisor_avatar;
   String advisor_desc;
   List<Service> services;
  
  factory Advisor.fromJson(Map<String,dynamic> json) => _$AdvisorFromJson(json);
  Map<String, dynamic> toJson() => _$AdvisorToJson(this);
}
