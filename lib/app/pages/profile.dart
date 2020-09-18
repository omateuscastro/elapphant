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

  Widget profileHeader() => Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                profileImage(_elephantStore.elephant.image),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      _elephantStore.elephant.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.only(bottom: 30),
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
          ],
        ),
      );

  Widget profileInfo() => Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "About",
                            textAlign: TextAlign.center,
                            style: subHeaderTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        profileDetailTitle("Name"),
                        SizedBox(
                          height: 8,
                        ),
                        profileDetailText(_elephantStore.elephant.name),
                        ...spacedDivider(),
                        profileDetailTitle("Species"),
                        SizedBox(
                          height: 8,
                        ),
                        profileDetailText(_elephantStore.elephant.species),
                        ...spacedDivider(),
                        Row(
                          children: <Widget>[
                            rowTile('DOB', _elephantStore.elephant.dob),
                            rowTile('DOD', _elephantStore.elephant.dod),
                          ],
                        ),
                        ...spacedDivider(),
                        profileDetailTitle("Note"),
                        SizedBox(
                          height: 8,
                        ),
                        profileDetailText(_elephantStore.elephant.note),
                        ...spacedDivider(),
                      ],
                    ),
                  ),
                ),

  Widget profileImage(url) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(url),
          ),
        ],
      );

  Widget rowTile(String title, String text) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: profileDetailTitleStyle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: profileDetailTextStyle,
            ),
          ],
        ),
      );

  // use with the spread operator
  List<Widget> spacedDivider() => [
        SizedBox(
          height: 8,
        ),
        Divider(),
        SizedBox(
          height: 8,
        ),
      ];

  Widget profileDetailTitle(text) => Text(
        text,
        style: profileDetailTitleStyle,
      );

  Widget profileDetailText(text) => Text(
        text,
        style: profileDetailTextStyle,
      );

  final TextStyle profileDetailTitleStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  final TextStyle profileDetailTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  final TextStyle subHeaderTextStyle = TextStyle(
    color: Colors.red,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 60, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.black, fontSize: 40),
        ),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 80,
      ),
      body: ListView(
        children: [
          Observer(builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                profileHeader(),
                SizedBox(
                  height: 10,
                ),
                profileInfo(),
                
              ],
            );
          })
        ],
      ),
    );
  }
}
