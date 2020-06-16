import 'package:flutter/material.dart';



class InicioTab extends StatelessWidget {

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
    Widget _buildBodyBack() =>
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF398AE5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
        );
    return Stack(

      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[


            SliverAppBar(
              leading: IconButton(icon: const Icon(Icons.menu),
                onPressed:
                    ( ) {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              expandedHeight:  150,
              floating:  false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title:  Text('N.U.B - Loja Virtual'),
                centerTitle: true,
                background:  Image.asset('assets/main.png', fit: BoxFit.cover,),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Card (color: Colors.blue,
                    child: Container(
                      child: Image.asset('assets/${index+1}.PNG'),
                    )
                );
              },
                childCount: 9,
              ),
            )
          ],
        ),
      ],
    );
  }
}