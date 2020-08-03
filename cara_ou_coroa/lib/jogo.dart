import 'package:flutter/material.dart';
import 'package:cara_ou_coroa/home.dart';

class Jogo extends StatefulWidget {
  var imagemApp;
  Jogo(this.imagemApp);
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  void _voltarInicio(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>Inicio())
    );
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image:this.widget.imagemApp,),
            GestureDetector(
              onTap: _voltarInicio,
              child: Image.asset("images/botao_voltar.png"),
            )
          ],
        ) ,      
      )      
    );
  }
}