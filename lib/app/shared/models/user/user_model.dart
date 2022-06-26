import 'dart:convert';

class UserModel {
  final String? userName;
  final String? userTipe;
  final String? userPhone;
  final String? userEmail;
  final String? userAddress;
  final String? userBirthday;

  UserModel({
    this.userName,
    this.userTipe,
    this.userPhone,
    this.userEmail,
    this.userAddress,
    this.userBirthday,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (userName != null) {
      map["userName"] = userName;
    }
    if (userAddress != null) {
      map["userTipe"] = userTipe;
    }
    if (userPhone != null) {
      map["userPhone"] = userPhone;
    }
    if (userEmail != null) {
      map["userEmail"] = userEmail;
    }
    if (userAddress != null) {
      map["userAddress"] = userAddress;
    }
    if (userBirthday != null) {
      map["userBirthday"] = userBirthday;
    }
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'],
      userTipe: map['userTipe'],
      userEmail: map['userEmail'],
      userBirthday: map['userBirthday'],
      userAddress: map['userAddress'],
      userPhone: map['userPhone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
