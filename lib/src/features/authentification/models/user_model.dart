class UserModel {
  final String? id;
  final String fullName;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.fullName,
    required this.password,
    required this.phoneNo,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Phone": phoneNo,
      "Password": password,
    };
  }
}
