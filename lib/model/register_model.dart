class RegisterModel {
  // String id;
  final String? name;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final String? password;

  RegisterModel({
    // this.id = "",
    this.name,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'name': name,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      };
  static RegisterModel fromJson(Map<String, dynamic> json) => RegisterModel(
        // id: json['id'],
        name: json['name'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
         email: json['email'],
        password: json['password'],
      );
}
