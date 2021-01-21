import 'package:assessment_by_maimunah_ibrahim/views/user_detail_view.dart';
import 'package:assessment_by_maimunah_ibrahim/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:assessment_by_maimunah_ibrahim/services/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UsersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            // physics: BouncingScrollPhysics(),
            children: [
              Text(
                "Users",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              FutureBuilder<List<UserData>>(
                  future: apiService.getData(),
                  initialData: [],
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, index) {
                          UserData _user = snapshot.data[index];
                          print(snapshot.data.length);
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, UserDetailView.route,
                                  arguments: _user);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Container(
                                //   decoration: BoxDecoration(
                                //       borderRadius:
                                //           BorderRadius.circular(10.0)),
                                //   child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(10.0),
                                //     child: Image.network(
                                //       _user.picture,
                                //       width: 40,
                                //       height: 40,
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        height: 45,
                                        width: 45,
                                        imageUrl: _user.picture,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      )),
                                ),

                                Text(
                                  _user.firstName + " " + _user.lastName,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error" + snapshot.error.toString());
                    }
                    return CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
