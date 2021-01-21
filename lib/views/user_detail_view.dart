import 'package:assessment_by_maimunah_ibrahim/views/user_model.dart';
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
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      // height: 45,
                      // width: 45,
                      imageUrl: _user.picture,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(_user.title.toUpperCase() +
                      " " +
                      _user.firstName +
                      " " +
                      _user.lastName),
                ],
              ),
              Text(_user.email)
            ],
          ),
        ),
      ),
    );
  }
}
