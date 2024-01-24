import 'package:json_annotation/json_annotation.dart';

part 'api_result.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResult {
  String CODE;
  String MESSAGE;

  ApiResult(this.CODE, this.MESSAGE);

  factory ApiResult.fromJson(Map<String, dynamic> json) =>
      _$ApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResultToJson(this);
}
