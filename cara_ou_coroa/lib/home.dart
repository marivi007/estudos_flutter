import 'package:cara_ou_coroa/jogo.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  var _imagemApp;
  

  void _abrirResultado(){
    var numero = Random().nextInt(2);
    if(numero==0)
    {
      setState(() {
        this._imagemApp = AssetImage("images/moeda_cara.png");
      });
    }else{
      setState(() {
        this._imagemApp = AssetImage("images/moeda_coroa.png");
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>Jogo(this._imagemApp))
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
            Image.asset("images/logo.png"),
            GestureDetector(
              onTap: _abrirResultado,
              child: Image.asset("images/botao_jogar.png"),
            )
          ],
        ) ,      
      )      
    );
     
  }
}