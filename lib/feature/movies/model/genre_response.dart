class GenreResponse {
  int? id;
  String? name;

  GenreResponse({this.id, this.name});

  factory GenreResponse.fromJson(Map<dynamic, dynamic> json) =>
      GenreResponse(id: json['id'] as int?, name: json['name'] as String?);

  Map<dynamic, dynamic> toJson() => {'name': name, 'id': id};
}
