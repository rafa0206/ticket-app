class User {
  int? id;
  String name;
  String email;
  String? password;
  String token;

  User({
    this.id,
    required this.name,
    required this.email,
    this.password,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id'] as num).toInt(),
      name: (json['name'] as String),
      email: (json['email'] as String),
      password: (json['password'] as String?) ?? '',
      token: (json['access_token'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      "access_token": token,
    };
  }
}
