import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:try_flutter/models/User.dart';

class UserDetailView extends StatelessWidget {
  final User user;

  UserDetailView({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Text(user.name),
    );
  }
}
