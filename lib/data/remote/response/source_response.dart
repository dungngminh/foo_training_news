import 'package:json_annotation/json_annotation.dart';

part 'source_response.g.dart';

@JsonSerializable(createToJson: false)
class SourceResponse {
  SourceResponse({
    this.id,
    this.name,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) =>
      _$SourceResponseFromJson(json);

  final String? id;
  final String? name;
}
