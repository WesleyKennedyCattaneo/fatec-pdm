import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Requisitar Jogos',
      theme: ThemeData.dark(),
      home: Request1(),
    );
  }
}

class Request1 extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Request1> {
  List<Item> jogoss = List();
  Item jogos;
  DatabaseReference jogosRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    jogos = Item("", "");
    final FirebaseDatabase database = FirebaseDatabase.instance;
    jogosRef = database.reference().child('jogos');
    jogosRef.onChildAdded.listen(_onEntryAdded);
    jogosRef.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      jogoss.add(Item.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = jogoss.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      jogoss[jogoss.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      jogosRef.push().set(jogos.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requisitar um jogo para a Loja'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(
                key: formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Digite o nome do jogo desejado",
                            border:  OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(15),
                              borderSide:  BorderSide(color: Colors.white),
                            )
                        ),
                        initialValue: "",
                        onSaved: (val) => jogos.title = val,
                        validator: (val) => val == "" ? val : null,


                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        initialValue: '',
                        onSaved: (val) => jogos.body = val,
                        validator: (val) => val == "" ? val : null,
                        decoration:  InputDecoration(
                            labelText: "Digite o nome do seu Sistema Operacional: ",
                            border:  OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(15),
                              borderSide:  BorderSide(color: Colors.white),
                            )
                        ),



                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        handleSubmit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: jogosRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new ListTile(
                  leading: Icon(Icons.message),
                  title: Text(jogoss[index].title),
                  subtitle: Text(jogoss[index].body),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String key;
  String title;
  String body;

  Item(this.title, this.body);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        body = snapshot.value["body"];

  toJson() {
    return {
      "title": title,
      "body": body,
    };
  }
}