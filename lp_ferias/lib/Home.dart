import 'package:flutter/material.dart';
import 'package:lp_ferias/Contacts.dart';
import 'package:lp_ferias/Localizacao.dart';
import 'package:lp_ferias/Triangulo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.my_location)),
                Tab(icon: Icon(Icons.contacts)),
              ],
            ),
            title: Text('TP FÉRIAS'),
          ),
          body: TabBarView(
            children: [
              Triangulo(),
              Localizacao(),
              Contacts(),
            ],
          ),
        ),
      ),
    );
  }
}