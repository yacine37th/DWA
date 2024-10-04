class UserModel {
  late String? uID;
  late String? email;
  late String? name;
  late List<dynamic> posts;
  // late String? phone;
  late String? type;
  
  // late List<dynamic> foodFavoris;
  // late var latitude;
  // late var longitude;
  UserModel({
    required this.uID,
    required this.email,
    required this.name,
    required this.posts,
    // required this.phone,
    required this.type,
  });
}
