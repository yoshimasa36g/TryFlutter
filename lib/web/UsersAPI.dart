import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:try_flutter/web/UsersAPIResponse.dart';

Future<UsersAPIResponse> fetchUsers() async {
  final response = await http.get('https://randomuser.me/api/?results=20');

  if (response.statusCode == 200) {
    return UsersAPIResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch users');
  }
}
