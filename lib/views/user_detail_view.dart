import 'package:assessment_by_maimunah_ibrahim/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserDetailView extends StatelessWidget {
  static String route = "/userDetailView";
  @override
  Widget build(BuildContext context) {
    UserData _user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "User Detail",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Hero(
                tag: _user.id,
                child: Container(
                  margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.fill,
                      imageUrl: _user.picture,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              UserDetail(
                title: "Title",
                value: _user.title[0].toUpperCase() + _user.title.substring(1),
              ),
              UserDetail(
                title: "First Name",
                value: _user.firstName,
              ),
              UserDetail(
                title: "Last Name",
                value: _user.lastName,
              ),
              UserDetail(
                title: "Email",
                value: _user.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  final String title;
  final String value;

  const UserDetail({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
