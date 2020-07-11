import 'package:flutter/material.dart';
import 'package:projetofatec/tabs/carrinho.dart';
import 'package:projetofatec/tabs/sobre.dart';
import 'package:projetofatec/login_fatec.dart';
import 'package:projetofatec/tabs/meusjogos.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projetofatec/request1.dart';
class InicioTab extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final List<String> _listViewData = [
    "Inicio",
    "Sobre-nós",
    "Minha Conta",
    "Sir",

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
              title:  Text('N.U.B - Loja Virtual:'),
              centerTitle: true,
              background:  Image.asset('assets/main.png', fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
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
              title: Text("Lançamentos"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => InicioTab()));
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
              leading:  Icon(Icons.payment),
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