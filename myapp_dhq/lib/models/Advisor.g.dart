// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Advisor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advisor _$AdvisorFromJson(Map<String, dynamic> json) => Advisor(
      json['advisor_avatar'] as String,
      json['advisor_desc'] as String,
      (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['advisor_name'] as String,
      json['advisor_id'] as String,
    );

Map<String, dynamic> _$AdvisorToJson(Advisor instance) => <String, dynamic>{
      'advisor_id': instance.advisor_id,
      'advisor_name': instance.advisor_name,
      'advisor_avatar': instance.advisor_avatar,
      'advisor_desc': instance.advisor_desc,
      'services': instance.services,
    };
