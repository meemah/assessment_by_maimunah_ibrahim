import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.data,
  });

  List<UserData> data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data:
            List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserData {
  UserData({
    this.id,
    this.lastName,
    this.firstName,
    this.email,
    this.title,
    this.picture,
  });

  String id;
  String lastName;
  String firstName;
  String email;
  String title;
  String picture;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        lastName: json["lastName"],
        firstName: json["firstName"],
        email: json["email"],
        title: json["title"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lastName": lastName,
        "firstName": firstName,
        "email": email,
        "title": title,
        "picture": picture,
      };
}

// import 'dart:convert';

// List<User> userFromJson(String str) =>
//     List<User>.from(json.decode(str)["data"].map((x) => User.fromJson(x)));

// String userToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class User {
//   User({
//     this.id,
//     this.lastName,
//     this.firstName,
//     this.email,
//     this.title,
//     this.picture,
//   });

//   String id;
//   String lastName;
//   String firstName;
//   String email;
//   String title;
//   String picture;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         lastName: json["lastName"],
//         firstName: json["firstName"],
//         email: json["email"],
//         title: json["title"],
//         picture: json["picture"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "lastName": lastName,
//         "firstName": firstName,
//         "email": email,
//         "title": title,
//         "picture": picture,
//       };
// }
