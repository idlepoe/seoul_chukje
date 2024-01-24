// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cultural_event_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CulturalEventInfo _$CulturalEventInfoFromJson(Map<String, dynamic> json) =>
    CulturalEventInfo(
      json['list_total_count'] as int,
      ApiResult.fromJson(json['RESULT'] as Map<String, dynamic>),
      (json['row'] as List<dynamic>)
          .map((e) =>
              CulturalEventInfoDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CulturalEventInfoToJson(CulturalEventInfo instance) =>
    <String, dynamic>{
      'list_total_count': instance.list_total_count,
      'RESULT': instance.RESULT.toJson(),
      'row': instance.row.map((e) => e.toJson()).toList(),
    };
