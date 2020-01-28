import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:try_flutter/models/User.dart';
import 'package:try_flutter/ui/CircleImage.dart';

class UserDetailView extends StatelessWidget {
  final User user;
  final _nameFont = TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold);

  UserDetailView({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleImage(
                url: user.imageURL,
                size: 200,
              ),
              _margin(),
              Text(
                user.name,
                style: _nameFont,
              ),
              _margin(),
              _buildProperty(Icons.email, user.email),
              _margin(),
              _buildProperty(Icons.phone, user.phone),
            ],
          ),
        ));
  }

  Widget _margin() {
    return SizedBox(
      height: 8.0,
    );
  }

  Widget _buildProperty(IconData icon, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(icon),
        ),
        Text(value)
      ],
    );
  }
}
