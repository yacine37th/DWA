class MedecineModel {
  late String? id;
  late String? name;
  late String? description;
  late String? image;
  late DateTime? expiredDate;
  late DateTime? postDate;
  late String? category;
  // late String? phone;
  MedecineModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.expiredDate,
    required this.category,
    required this.postDate,
  });
}
