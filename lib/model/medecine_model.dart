class MedecineModel {
  late String? id;
  late String? name;
  late String? description;
  late String? image;
  late DateTime? expiredDate;
  late String? category;
  MedecineModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.expiredDate,
    required this.category,
  });
}
