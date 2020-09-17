import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  profilePhoto(photoUrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 100.0,
          backgroundColor: Colors.grey,
          backgroundImage: CachedNetworkImageProvider(photoUrl),
        ),
      ],
    );
  }

  Widget rowCell(String count, String type) => new Expanded(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            '$count',
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black),
          ),
          new Text(type,
              textAlign: TextAlign.left,
              style: new TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal))
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 54),
        ),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 100,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      profilePhoto(
                          'https://elephant-api.herokuapp.com/pictures/missing.jpg'),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Teste",
                          style: TextStyle(
                            fontSize: 18,
                            // fontFamily: Theme.of(context).textTheme.title.fontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 18,
                            // fontFamily: Theme.of(context).textTheme.title.fontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "About",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,

                          // fontFamily: Theme.of(context).textTheme.title.fontFamily,
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text("Teste"),
                    subtitle: Text("Teste"),
                  ),
                  ListTile(
                    title: Text("Teste"),
                    subtitle: Text("Teste"),
                  ),
                  new Row(
                    children: <Widget>[
                      rowCell('Teste', 'Teste'),
                      rowCell('Teste', 'Teste'),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     ListTile(
                  //       title: Text("Teste"),
                  //       subtitle: Text("Teste"),
                  //     ),
                  //     ListTile(
                  //       title: Text("Teste"),
                  //       subtitle: Text("Teste"),
                  //     ),
                  //   ],
                  // ),
                  // ListTile(
                  //   title: Text("Teste"),
                  //   subtitle: Text("Teste"),
                  // )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: <Widget>[
                  //     ListTile(
                  //       title: Text(
                  //         "Name",
                  //         textAlign: TextAlign.left,
                  //         style: TextStyle(
                  //           fontSize: 18,

                  //           // fontFamily: Theme.of(context).textTheme.title.fontFamily,
                  //         ),
                  //       ),
                  //       subtitle: Text(
                  //         "Rahul",
                  //         textAlign: TextAlign.left,
                  //         style: TextStyle(
                  //           fontSize: 18,

                  //           // fontFamily: Theme.of(context).textTheme.title.fontFamily,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
