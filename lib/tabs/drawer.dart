import 'package:flutter/material.dart';

class SliverAppBarDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Sliver AppBar Drawer Example"),
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text('Main Body'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: _listViewData
                .map((data) => ListTile(
              title: Text(data),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}