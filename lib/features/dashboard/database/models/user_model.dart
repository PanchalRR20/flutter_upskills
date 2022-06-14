class UserModel {
  var firstName, lastName, email, uid;

  UserModel(
      {this.email = '',
        this.firstName = '',
        this.lastName = '',
        this.uid = ''});

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "uid": uid,
    };
  }

  static UserModel fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      uid: json["uid"],
    );
  }
}
