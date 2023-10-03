class UserModel {
  late int id;
  late String name;
  late String email;
  String? imageurl;
  late String password;
  late String telephone;
  late String type;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.telephone,
    required this.type, // Initialize 'type' in the constructor
    this.imageurl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    telephone = json['telephone'];
    type = json['type']; // Fixed typo here
    imageurl = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'telephone': telephone, // Fixed typo here
    };
    if (imageurl != null) {
      data['imageurl'] = imageurl;
    }
    return data;
  }
}
