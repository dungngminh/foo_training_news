class SourceResponse {
  SourceResponse({
    this.id,
    this.name,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  final String? id;
  final String? name;
}
