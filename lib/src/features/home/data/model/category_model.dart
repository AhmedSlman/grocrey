class CategoryModel {
  int id;
  String name;
  String description;
  String image_path;
  String created_at;
  String updated_at;
  int products_count;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image_path,
    required this.created_at,
    required this.updated_at,
    required this.products_count,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image_path: json['image_path'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      products_count: json['products_count'],
    );
  }
}
