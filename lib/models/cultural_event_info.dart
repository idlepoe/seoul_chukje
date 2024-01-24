import 'package:json_annotation/json_annotation.dart';

import 'api_result.dart';
import 'cultural_event_info_detail.dart';

part 'cultural_event_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CulturalEventInfo{
  int list_total_count;
  ApiResult RESULT;
  List<CulturalEventInfoDetail> row;

  CulturalEventInfo(this.list_total_count, this.RESULT, this.row);

  factory CulturalEventInfo.fromJson(Map<String, dynamic> json) => _$CulturalEventInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CulturalEventInfoToJson(this);

  @override
  String toString() {
    return 'CulturalEventInfo{list_total_count: $list_total_count, RESULT: $RESULT, row: $row}';
  }
}