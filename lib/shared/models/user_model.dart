class UserModel {
  final String name;
  final String profileImage;
  final String phoneNumber;
  final String email;
  final String address;

  UserModel({
    required this.name,
    required this.profileImage,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  // Factory method to create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
    );
  }

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }
}
