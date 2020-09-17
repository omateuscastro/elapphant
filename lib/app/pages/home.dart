import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:elapphant/app/models/elephant.dart';
import 'package:elapphant/app/pages/profile.dart';
import 'package:elapphant/app/stores/elephant_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ElephantStore _elephantStore;

  @override
  void initState() {
    super.initState();
    _elephantStore = GetIt.instance<ElephantStore>();
    if (_elephantStore.elephant == null) {
      _elephantStore.getNewElephant();
    }

    print(_elephantStore.elephant);
  }

  Future<void> _changeElephant() async {
    await _elephantStore.getNewElephant();
    print(_elephantStore.elephant);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Descubra",
            style: TextStyle(color: Colors.white, fontSize: 54),
          ),
          backgroundColor: Color.fromRGBO(253, 14, 66, 1),
          bottomOpacity: 0.0,
          elevation: 0.0,
          toolbarHeight: 100,
        ),
        body: Stack(children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    // colors: [Colors.red[600], Colors.red[900]],
                    colors: [
                      Color.fromRGBO(253, 14, 66, 1),
                      Color.fromRGBO(190, 15, 48, 1)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Observer(
              name: 'Elephant',
              builder: (BuildContext context) {
                return (_elephantStore.elephant != null)
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 100,
                                        top: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl: _elephantStore.elephant.image,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.only(
                                        left: 30.0, right: 30.0, top: 400),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // margin: const EdgeInsets.symmetric(
                                    //     horizontal: 16, vertical: 12),
                                    child: ListTile(
                                      title: Text(
                                        _elephantStore.elephant.name,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          _elephantStore.elephant.sex ==
                                                  'Female'
                                              ? Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.pink,
                                                  ),
                                                  child: Icon(
                                                    MdiIcons.genderFemale,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                )
                                              : Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.blue,
                                                  ),
                                                  child: Icon(
                                                    MdiIcons.genderMale,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              _elephantStore.elephant.species,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: _changeElephant,
          tooltip: 'Find a new elephant.',
          child: Icon(
            Icons.refresh,
            size: 42,
            color: Colors.amber[700],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
