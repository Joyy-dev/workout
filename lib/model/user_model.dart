class UserModel {
  final String id;
  final String firstName;
  final String email;
  final String? photoUrl;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
    this.photoUrl
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id, 
      firstName: data['firstname'], 
      email: data['email'],
      photoUrl: data['[photoUrl]']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstname': firstName,
      'photoUrl': photoUrl
    };
  }
}
