import 'package:try_flutter/web/UserOnAPI.dart';

class UsersAPIResponse {
  final List<UserOnAPI> results;

  UsersAPIResponse({this.results});

  factory UsersAPIResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> results = json['results'];
    final List<UserOnAPI> users = results.map((dynamic user) => UserOnAPI.fromJson(user)).toList();
    return UsersAPIResponse(results: users);
  }
}