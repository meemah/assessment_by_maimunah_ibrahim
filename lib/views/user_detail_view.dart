import 'package:assessment_by_maimunah_ibrahim/views/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailView extends StatelessWidget {
  static String route = "/userDetailView";
  @override
  Widget build(BuildContext context) {
    UserData _user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.network(_user.picture),
            Text(_user.title + " " + _user.firstName + " " + _user.lastName),
            Text(_user.email)
          ],
        ),
      ),
    );
  }
}
