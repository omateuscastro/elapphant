import 'package:cached_network_image/cached_network_image.dart';
import 'package:elapphant/app/stores/elephant_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ElephantStore _elephantStore;

  @override
  void initState() {
    super.initState();
    _elephantStore = GetIt.instance<ElephantStore>();
  }

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
          child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              '$count',
              textAlign: TextAlign.left,
              style: new TextStyle(color: Colors.black, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(type,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300)),
            )
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
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
            Observer(builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        profilePhoto(_elephantStore.elephant.image),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              _elephantStore.elephant.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.pink,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "About",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _elephantStore.elephant.sex == 'Female'
                                    ? Colors.pink
                                    : Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text("Name"),
                      subtitle: Text(_elephantStore.elephant.name),
                    ),
                    ListTile(
                      title: Text("Species"),
                      subtitle: Text(_elephantStore.elephant.species),
                    ),
                    new Row(
                      children: <Widget>[
                        rowCell('DOB', _elephantStore.elephant.dob),
                        rowCell('DOD', _elephantStore.elephant.dod),
                      ],
                    ),
                    ListTile(
                      title: Text("Note"),
                      subtitle: Text(_elephantStore.elephant.note),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
