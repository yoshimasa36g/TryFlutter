
import 'package:flutter/cupertino.dart';
import 'package:try_flutter/models/User.dart';
import 'package:try_flutter/ui/CircleImage.dart';

class UserSummaryView extends StatelessWidget {
  final User user;

  UserSummaryView({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleImage(url: user.thumbnailURL, size: 60.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(user.name),
                Text(user.email)
              ],
            )
          ],
        ),
      ));
  }
}