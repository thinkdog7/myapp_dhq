// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      json['service_desc'] as String,
      json['service_name'] as String,
      json['service_price'] as num,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'service_name': instance.service_name,
      'service_desc': instance.service_desc,
      'service_price': instance.service_price,
    };
