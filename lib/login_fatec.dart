import 'package:firebase_auth/firebase_auth.dart';
import  'package:flutter/material.dart';

        import 'package:projetofatec/tabs/home_tab.dart';

          class LoginScreen extends StatefulWidget {
            @override
            _LoginScreenState createState () => _LoginScreenState();
          }
          final FirebaseAuth mAuth = FirebaseAuth.instance;

          class _LoginScreenState extends State<LoginScreen> {
            TextEditingController emailController = new TextEditingController();
            TextEditingController passwordController = new TextEditingController();

            String _email, _password;
            final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
            Widget appBarTitle = Text('N.U.B - Venda de jogos eletronicos');

            @override
            Widget build(BuildContext context) {
              return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  title: appBarTitle,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter, colors: [
                          Color(0xFF89D3FB),
                          Color(0xFF89D3FB),


                        ])
                    ),
                  ),
                ),
                body: Container(

                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 32),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF89D3FB),
                                  Color(0xFF0E90E1)
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(60)

                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Align(
                                alignment: Alignment(0.0, -2),
                                child:
                                Icon(Icons.person, size: 150,
                                  color: Colors.white,
                                ),
                              ),

                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text('Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 20.0,
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

                                      decoration: BoxDecoration(

                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 2
                                            )
                                          ]
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'Digite: plotze@outlook.com'
                                        ),
                                        onChanged: (input) => _email = input,
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

                                      decoration: BoxDecoration(

                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 2
                                            )
                                          ]
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'Digite: 123456'
                                        ),
                                        onChanged: (input) => _password = input,
                                        obscureText: true,

                                      ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text('Esqueci minha senha'),


                        ),

                        new GestureDetector(

                          child: RaisedButton(
                            onPressed:  loginUser,
                            child: Container(

                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.5,
                              height: 50,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF89D3FB),
                                      Color(0xFF0E90E1)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50)
                                  )
                              ),
                              child: Center(

                                child: Text('login'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),

                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                ),
              );
            }

            Future<FirebaseUser> loginUser() async {
              try {
                await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(email: _email, password: _password);
                Navigator.push(context, MaterialPageRoute(builder:  (context) => InicioTab()));
              } catch (e) {
                throw new AuthException(e.code, e.message);
              }
            }


          }
