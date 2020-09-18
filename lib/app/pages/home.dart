import 'package:cached_network_image/cached_network_image.dart';
import 'package:elapphant/app/pages/profile.dart';
import 'package:elapphant/app/stores/elephant_store.dart';
import 'package:elapphant/app/widgets/color_loader.dart';
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
  }

  Future<void> _changeElephant() async {
    await _elephantStore.getNewElephant();
  }

  Widget cardLoagindElephant() => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          'assets/images/elephant.png',
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(30),
      );

  Widget wdgtLoadingElephant() => Stack(
        children: [
          cardLoagindElephant(),
          Card(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 360),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                "Looking for an elephant...",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Center(
            child: ColorLoader(
              radius: 20,
              dotRadius: 6,
            ),
          ),
        ],
      );

  Widget wdgtElephantNotFound() => Stack(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              'assets/images/tantor.png',
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.only(top: 100, left: 30, right: 30),
          ),
          Card(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 356),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                "Oh no... no elephant was found... please try again!",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      );

  Widget elephantFemaleIcon() => Container(
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
      );

  Widget elephantMaleIcon() => Container(
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
      );

  Widget elephantImage() => Container(
        margin: const EdgeInsets.only(
            left: 30.0, right: 30.0, bottom: 100, top: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: _elephantStore.elephant.image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => Center(
              child: ColorLoader(
                radius: 20,
                dotRadius: 6,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      );

  Widget elephantCardInfo() => Card(
        margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 420),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            _elephantStore.elephant.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _elephantStore.elephant.sex == 'Female'
                    ? elephantFemaleIcon()
                    : elephantMaleIcon(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
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
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Discover",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          backgroundColor: Color.fromRGBO(253, 14, 66, 1),
          bottomOpacity: 0.0,
          elevation: 0.0,
          toolbarHeight: 80,
        ),
        body: Stack(children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
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
                    ? Container(
                        child: _elephantStore.elephant.name != null
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
                                          elephantImage(),
                                          elephantCardInfo()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : wdgtElephantNotFound(),
                      )
                    : wdgtLoadingElephant();
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
