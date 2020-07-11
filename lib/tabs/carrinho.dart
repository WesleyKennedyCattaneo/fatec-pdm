import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetofatec/tabs/home_tab.dart';
import 'package:projetofatec/tabs/meusjogos.dart';
import 'package:projetofatec/Request1.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CarrinhoCompras());
  }
}

class CarrinhoCompras extends StatefulWidget {
  @override
  _CarrinhoComprasState createState() => _CarrinhoComprasState();
}

class _CarrinhoComprasState extends State<CarrinhoCompras> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final List<String> _listViewData = [



    "Inicio",
    "Sobre-nós",
    "Minha Conta",
    "Sair",

  ];


  List picked = [false, false];

  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 60 * count;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                title:  Text('Selecione os Jogos:'),
                centerTitle: true,
                background:  Image.asset('assets/main.png', fit: BoxFit.cover,),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
              ),
            ),
            SliverFillRemaining(
              child: Stack(
                children: <Widget>[
                  Stack(children: [
                    Stack(children: <Widget>[
                      Container(
                        height:0,
                        width: 0,
                      ),
                      Container(
                        height: 0.0,
                        width: double.infinity,
                        color: Colors.blue,
                      ),


                      Positioned(
                        top: 10.0,
                        child: Column(
                          children: <Widget>[
                            itemCard('Annie Amber', ' Windows', '60',
                                'assets/2.PNG', true, 0),
                            itemCard('Archer', ' Windows', '60',
                                'assets/1.PNG', true, 1),
                            itemCard('Indisponivel', 'gray', '60',
                                'assets/3.PNG', false, 2)
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 515.0, bottom: 15.0),
                          child: Container(
                              height: 50.0,
                              width: double.infinity,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text('Total: \$' + totalAmount.toString()),
                                  SizedBox(width: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Obrigado pela compra!'),
                                            content: Text('O jogo será enviado a conta cadastrada dentro de 1 hora.'),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Ok'),
                                                onPressed: (){
                                                  Navigator.of(context).pop('Ok');
                                                },
                                              ),
                                            ],
                                          ),



                                        );

                                      },
                                      elevation: 0.5,
                                      color: Colors.blueAccent,
                                      child: Center(
                                        child: Text(
                                          'Confirmar Compra',
                                        ),
                                      ),
                                      textColor: Colors.white,
                                    ),
                                  )
                                ],
                              )))
                    ]
                    )
                  ]
                  )





                ],
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
                            builder: (BuildContext context) => InicioTab()));
                  },
                )





              ],
            )

        ),



        bottomNavigationBar: Material(
          elevation: 7.0,
          color: Colors.white,
        )
    );
  }

  Widget itemCard(itemName, color , price, imgPath, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          pickToggle(i);
        }
      },
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 3.0,
              child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 10.0),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: available
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.red.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                  child: available
                                      ? Container(
                                    height: 12.0,
                                    width: 12.0,
                                    decoration: BoxDecoration(
                                        color: picked[i]
                                            ? Colors.blue
                                            : Colors.grey
                                            .withOpacity(0.4),
                                        borderRadius:
                                        BorderRadius.circular(6.0)),
                                  )
                                      : Container()))
                        ],
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 150.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(width: 4.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                itemName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(width: 7.0),
                              available
                                  ? picked[i]
                                  ? Text(
                                'x1',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: Colors.grey),
                              )
                                  : Container()
                                  : Container()
                            ],
                          ),
                          SizedBox(height: 7.0),
                          available
                              ? Text(
                            'Plataforma:' + color,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey),
                          )
                              : Container(



                          ),
                          SizedBox(height: 3.0),
                          available
                              ? Text(
                            'R\$ ' + price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black

                            ),
                          )
                              : Container(),
                        ],
                      )
                    ],
                  )))),
    );
  }
}



