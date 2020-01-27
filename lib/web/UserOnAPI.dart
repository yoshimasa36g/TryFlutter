class UserOnAPI {
  final String gender;
  final UserName name;
  final String email;
  final String phone;
  final UserPicture picture;

  UserOnAPI({this.gender, this.name, this.email, this.phone, this.picture});

  factory UserOnAPI.fromJson(Map<String, dynamic> json) {
    return UserOnAPI(
      gender: json['gender'],
      name: UserName.fromJson(json['name']),
      email: json['email'],
      phone: json['phone'],
      picture: UserPicture.fromJson(json['picture'])
    );
  }
}

class UserName {
  final String title;
  final String first;
  final String last;

  UserName({this.title, this.first, this.last});

  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;

  UserPicture({this.large, this.medium, this.thumbnail});

  factory UserPicture.fromJson(Map<String, dynamic> json) {
    return UserPicture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail']
    );
  }
}
