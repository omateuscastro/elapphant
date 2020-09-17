import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:elapphant/app/models/elephant.dart';
import 'package:elapphant/app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Elephant _el = new Elephant(
      id: 'Teste',
      name: 'teste',
      species: 'teste',
      sex: 'Female',
      image: 'https://elephant-api.herokuapp.com/pictures/missing.jpg');

  Future<void> _changeElephant() async {
    Response response = await Dio().get(
      'https://elephant-api.herokuapp.com/elephants/random',
    );

    var teste =
        (response.data as List).map((e) => Elephant.fromJson(e)).toList();

    setState(() {
      print(teste[0].name);
      print(teste[0].sex);
      print(teste[0].image);
      if (teste[0].name != null) {
        _el = teste[0];
      }
    });
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
          GestureDetector(
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
                            left: 30.0, right: 30.0, bottom: 100, top: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: _el.image,
                            imageBuilder: (context, imageProvider) => Container(
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
                            borderRadius: BorderRadius.circular(10)),
                        // margin: const EdgeInsets.symmetric(
                        //     horizontal: 16, vertical: 12),
                        child: ListTile(
                          title: Text(
                            _el.name,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              _el.sex == 'Female'
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
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  _el.species,
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
          ),
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
        ), // This trailing comma makes auto-formatting nicer for build methods.
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
