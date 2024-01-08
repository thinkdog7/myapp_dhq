import 'package:json_annotation/json_annotation.dart';

part 'Service.g.dart';

@JsonSerializable()
class Service {
  Service(this.service_desc,this.service_name,this.service_price);

   String service_name;
   String service_desc;
   num service_price;
  
  factory Service.fromJson(Map<String,dynamic> json) => _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
