class User {
  final String id;
  final String email;
  final String userName;
  
  User({required this.id, required this.email, required this.userName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      userName: json['userName']
    );
  }
}