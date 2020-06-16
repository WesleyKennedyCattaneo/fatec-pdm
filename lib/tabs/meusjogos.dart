import 'package:flutter/material.dart';
import 'package:projetofatec/tabs/sobre.dart';
import 'package:projetofatec/tabs/home_tab.dart';
import 'package:projetofatec/tabs/carrinho.dart';



class MeusJogos extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final List<String> _listViewData = [



    "Inicio",
    "Sobre-nós",
    "Minha Conta",
    "Sair",

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
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,



      key: _scaffoldKey,

      body: CustomScrollView(
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
              title:  Text('Meus Jogos:'),
              centerTitle: true,
              background:  Image.asset('assets/g3.PNG', fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
            ),
          ),
          SliverGrid(
            gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(

              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing:  10.0,
              childAspectRatio:  4.0,


            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Card (color: Colors.blue,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/1.PNG"),

                      //fit: BoxFit.fitWidth,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child:
                  Container(
                    child: Align(
                      alignment:  Alignment.centerRight,
                      child: Text("Nome do jogo: Archer\nTempo de jogo: 29 horas"),

                    ),
                  )
                ),



              );

            },

              childCount: 1,
            ),
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(

            children: <Widget>[
              DrawerHeader(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("N.U.B - Loja de Games",  style:  TextStyle(
                    color: Colors.white,
                    fontFamily:  'OpenSans',
                    fontSize:  20.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                //child: Text("N.U.B - Loja de Games" ),
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/mainblur.png"),
                    fit: BoxFit.cover,
                  ),
                ),

              ),
              ListTile(
                leading:  Icon(Icons.home),
                //trailing:  Icon(Icons.home),
                title: Text("Inicio"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => InicioTab()));
                },
              ),
              ListTile(
                leading:  Icon(Icons.account_circle),
                //trailing:  Icon(Icons.home),
                title: Text("Comprar"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CarrinhoCompras()));
                },
              ),
              ListTile(
                leading:  Icon(Icons.videogame_asset),
                //trailing:  Icon(Icons.home),
                title: Text("Meus Jogos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => InicioTab()));
                },
              ),
              ListTile(
                leading:  Icon(Icons.info),
                //trailing:  Icon(Icons.home),
                title: Text("Sobre o Desenvolvedor"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SobreDev()));
                },
              )





            ],
          )

      ),
    );
  }
}