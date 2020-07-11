import 'package:flutter/material.dart';
import 'package:projetofatec/tabs/home_tab.dart';
import 'package:projetofatec/tabs/meusjogos.dart';
import 'package:projetofatec/tabs/carrinho.dart';
import 'package:projetofatec/Request1.dart';

class SobreDev extends StatelessWidget {

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
      backgroundColor: Colors.blueAccent,
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
              title:  Text('Sobre o Dev:', style:  TextStyle(
                color: Colors.white,
                fontFamily:  'OpenSans',
                fontSize:  20.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              centerTitle: true,
              background:  Image.asset('assets/dev.png', fit: BoxFit.cover,),
            ),
          ),

          SliverToBoxAdapter(
            child:  Container(
                height: 550,
                width: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/foto.png'),
                        fit: BoxFit.contain)),
          ),
          ),
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
                          builder: (BuildContext context) => MeusJogos()));
                },

              ),
              ListTile(
                leading:  Icon(Icons.send),
                //trailing:  Icon(Icons.home),
                title: Text("Requisitar Jogo"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Request1()));
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