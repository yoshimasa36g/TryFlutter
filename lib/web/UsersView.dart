import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:try_flutter/models/User.dart';
import 'package:try_flutter/ui/UserSummaryView.dart';
import 'package:try_flutter/web/UsersAPI.dart';
import 'package:try_flutter/web/UsersAPIResponse.dart';

class UsersView extends StatefulWidget {
  @override
  UsersViewState createState() => UsersViewState();
}

class UsersViewState extends State<UsersView> {
  Future<UsersAPIResponse> usersResponse;

  @override
  void initState() {
    super.initState();
    usersResponse = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Try Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<UsersAPIResponse>(
            future: usersResponse,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              if (snapshot.hasData) {
                return _buildUsers(snapshot.data);
              }

              return CircularProgressIndicator();
            },
          ),
        ));
  }

  Widget _buildUsers(UsersAPIResponse response) {
    final users = response.results.map((x) => x.toUser()).toList();
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return _buildRow(users[index]);
        });
  }

  Widget _buildRow(User user) {
    return Column(
      children: <Widget>[
        Material(
          child: InkWell(
            onTap: (){ print('on tapped'); },
            child: UserSummaryView(user: user),
          ),
        ),
        Divider()
      ],
    );
  }
}
