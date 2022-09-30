class DocsModel {
  String id;
  final String? title;
  final String? description;
  final String? data;
  DocsModel({
    this.id = "",
    this.title,
    this.description,
    this.data,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'data': data,
      };
  static DocsModel fromJson(Map<String, dynamic> json) => DocsModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        data: json['data'],
      );
}
