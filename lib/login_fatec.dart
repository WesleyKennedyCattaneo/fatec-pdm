         import  'package:flutter/material.dart';

        import 'package:projetofatec/tabs/home_tab.dart';

          class LoginScreen extends StatefulWidget {
            @override
            _LoginScreenState createState () => _LoginScreenState();
          }

          class _LoginScreenState extends State<LoginScreen> {
            Widget appBarTitle =  Text('N.U.B - Venda de jogos eletronicos');

            @override
            Widget build(BuildContext context) {
              return Scaffold(
                appBar:  AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  title: appBarTitle,
                  flexibleSpace:  Container(
                    decoration:  BoxDecoration(
                      gradient:  LinearGradient(begin: Alignment.bottomCenter , colors: [
                        Color(0xFF89D3FB),
                        Color(0xFF89D3FB),


                          ])
                    ),
                  ),
                ),
                body: Container(
                  child: Column (
                    children: <Widget>[
                      Container(
                        padding:  EdgeInsets.only(top: 32),
                      width:  MediaQuery.of(context).size.width,
                      height:  MediaQuery.of(context).size.width,
                       decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end:  Alignment.bottomCenter,
                          colors: [
                            Color(0xFF89D3FB),
                            Color(0xFF0E90E1)
                          ],
                        ),
                         borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight:  Radius.circular(60)

                         )
                      ),
                        child:  Column(
                         mainAxisAlignment: MainAxisAlignment.center ,
                          children: <Widget>[

                            Align(
                              alignment: Alignment(0.0,  -2),
                              child:
                                Icon(Icons.person, size: 150,
                                  color: Colors.white,
                                ),
                            ),

                           Align(
                             alignment: Alignment.bottomCenter,
                             child: Text('Login',
                               style:  TextStyle(
                                 color: Colors.white,
                                 fontFamily:  'OpenSans',
                                 fontSize:  20.0,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50,

                                width: 300,

                                padding: EdgeInsets.all(10),

                                decoration:  BoxDecoration(

                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  color: Colors.white,
                                  boxShadow:  [
                                    BoxShadow(
                                      color:  Colors.black,
                                      blurRadius:  2
                                    )
                                  ]
                                ),
                                child: TextField(
                                  keyboardType:  TextInputType.emailAddress,
                                    decoration:  InputDecoration(
                                      icon: Icon(Icons.email),
                                        hintText:  'Digite seu Email ou ID',
                                    ),
                                    style: TextStyle(
                                        color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50,

                                  width: 300,

                                  padding: EdgeInsets.all(10),

                                  decoration:  BoxDecoration(

                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      color: Colors.white,
                                      boxShadow:  [
                                        BoxShadow(
                                            color:  Colors.black,
                                            blurRadius:  2
                                        )
                                      ]
                                  ),
                                  child: TextField(
                                    keyboardType:  TextInputType.emailAddress,
                                    decoration:  InputDecoration(
                                      icon: Icon(Icons.security),
                                      hintText:  'Digite sua senha',
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                Align(
                  alignment:  Alignment.center,
                  child: Text('Esqueci minha senha'),



                        ),

                      new GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => InicioTab()));
                      },
                        child: Container(

                          width:  MediaQuery.of(context).size.width/1.5,
                            height:  50,
                          decoration:  BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF89D3FB),
                                Color(0xFF0E90E1)
                              ],
                            ),
                            borderRadius:  BorderRadius.all(
                              Radius.circular(50)
                            )
                          ),
                          child: Center(

                          child: Text ('login'. toUpperCase(),
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),

                        ),
                      )


                ],
              ),
              ),
              );
            }
}

