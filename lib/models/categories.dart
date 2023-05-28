import 'dart:convert';

class Categories {
  final String id;
  final String title;
  final String image;
  final num? star;

  Categories({required this.id, required this.title, required this.image,this.star});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'id': id,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      star: map['star'] ?? 3,

      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source));
}
