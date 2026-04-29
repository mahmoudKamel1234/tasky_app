class AppUser {
  AppUser({this.name, this.email, this.password, this.phone, this.id});
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      name: json["name"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      phone: json["phone"] as String,
      id: json["id"] as String,
    );
  }
  String? name;
  String? email;
  String? password;
  String? phone;
  String? id;

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "id": id,
    };
  }
}
