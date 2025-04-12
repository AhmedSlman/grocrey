class ProfileModel {
  final int id;
  final String name;
  final String last_name;
  final String email;
  final String phone;
  final String image;
  final String address;
  final String email_verified_at;
  final String created_at;
  final String updated_at;
  ProfileModel(
    this.id,
    this.name,
    this.last_name,
    this.email,
    this.phone,
    this.image,
    this.address,
    this.email_verified_at,
    this.created_at,
    this.updated_at,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      json['id'] as int ?? 0,
      json['name'] as String ?? '',
      json['last_name'] as String ?? '',
      json['email'] as String ?? '',
      json['phone'] as String ?? '',
      (json['image'] as String?) ?? 'assets/images/user.png',
      json['address'] as String ?? '',
      json['email_verified_at'] ?? '',
      json['created_at'] as String ?? '',
      json['updated_at'] as String ?? '',
    );
  }
}
