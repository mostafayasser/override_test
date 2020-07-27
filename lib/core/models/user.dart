class User {
  String id;
  String email;
  String userToken;
  String firstName;
  String lastName;

  User({this.id, this.email, this.firstName, this.lastName, this.userToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    userToken = json['user_token'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['email'] = this.email;
    data['user_token'] = this.userToken;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;

    return data;
  }
}
