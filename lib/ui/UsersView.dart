import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:try_flutter/models/User.dart';
import 'package:try_flutter/ui/UserDetailView.dart';
import 'package:try_flutter/ui/UserSummaryView.dart';
import 'package:try_flutter/web/UsersAPI.dart';
import 'package:try_flutter/web/UsersAPIResponse.dart';

class UsersView extends StatefulWidget {
  @override
  UsersViewState createState() => UsersViewState();
}

class UsersViewState extends State<UsersView> {
  Future<UsersAPIResponse> usersResponse;
  List<User> _users = [];
  String _keyword = "";

  @override
  void initState() {
    super.initState();
    usersResponse = fetchUsers().then((response) {
      setState(() {
        _users = response.results.map((x) => x.toUser()).toList();
      });
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Try Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildUsers(),
      ),
    );
  }

  Widget _buildUsers() {
    final users = _users.where((x) => x.name.contains(_keyword)).toList();
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: TextField(
            onChanged: (text) {
              setState(() {
                _keyword = text;
              });
            },
          ),
        ),
        Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return _buildRow(users[index]);
                })),
      ],
    );
  }

  Widget _buildRow(User user) {
    return Column(
      children: <Widget>[
        Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserDetailView(user: user)));
            },
            child: UserSummaryView(user: user),
          ),
        ),
        Divider()
      ],
    );
  }
}
