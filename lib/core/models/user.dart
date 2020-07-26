class User {
  int id;
  String email;
  String password;
  String fcmToken;
  String fullName;
  String phoneNumber;
  String imageUrl;
  String userType;
  String username;

  User({
    this.password,
    this.fcmToken,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.imageUrl,
    this.userType,
    this.id,
    this.username,
  });

  User.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcmToken'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    userType = json['userType'];
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fcmToken != null) {
      data['fcmToken'] = this.fcmToken;
    }
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['userType'] = this.userType;
    data['id'] = this.id;
    data['username'] = this.username;

    return data;
  }
}

class CustomPermessionGroup {
  int id;

  CustomPermessionGroup({this.id});

  CustomPermessionGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
