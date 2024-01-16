class UserModel {
  late String? uID;
  late String? email;
  late String? name;
  late List<dynamic> posts;

  // late List<dynamic> foodFavoris;
  // late var latitude;
  // late var longitude;
  UserModel({
    required this.uID,
    required this.email,
    required this.name,
    required this.posts,
    // required this.latitude,
    // required this.longitude,
  });
}
