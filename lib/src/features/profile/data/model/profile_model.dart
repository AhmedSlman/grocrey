class ProfileModel {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String? firebaseUid;
  final String phone;
  final String image;
  final String address;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.firebaseUid,
    required this.phone,
    required this.image,
    required this.address,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      firebaseUid: json['firebase_uid'], // nullable
      phone: json['phone'] ?? '',
      image:
          json['image'] ??
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      address: json['address'] ?? '',
      emailVerifiedAt: json['email_verified_at'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'last_name': lastName,
      'email': email,
      'firebase_uid': firebaseUid,
      'phone': phone,
      'image': image,
      'address': address,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
