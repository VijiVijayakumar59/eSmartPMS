class UserModel {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String contact;
  final String address;
  final String nationalId;
  final String country;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.contact,
    required this.address,
    required this.nationalId,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      contact: json['contact'],
      address: json['address'],
      nationalId: json['national_id'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'password': password,
      'contact': contact,
      'address': address,
      'national_id': nationalId,
      'country': country,
    };
  }
}
