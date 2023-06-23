class CategoryModel {
  final int id;
  final String name;
  bool selected = false;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], name: json["name"]);
  }
}
