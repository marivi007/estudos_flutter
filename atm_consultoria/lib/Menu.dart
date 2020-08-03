import 'package:atm_consultoria/TabCliente.dart';
import 'package:atm_consultoria/TabContato.dart';
import 'package:atm_consultoria/TabEmpresa.dart';
import 'package:atm_consultoria/TabServico.dart';
import 'package:flutter/material.dart';


class MenuInicial extends StatefulWidget {
  @override
  _MenuInicialState createState() => _MenuInicialState();
}

class _MenuInicialState extends State<MenuInicial> {

  void _abrirEmpresa(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder:(context)=>TelaEmpresa())
    );
  }

  void _abrirServico(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder:(context)=>TelaServico())
    );
  }

  void _abrirCliente(){
     Navigator.push(
      context, 
      MaterialPageRoute(builder:(context)=>TelaCliente())
    );
  }

  void _abrirContato(){
     Navigator.push(
      context, 
      MaterialPageRoute(builder:(context)=>TelaContato())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body:Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Image.asset("images/logo.png"),
               Padding(
                 padding: EdgeInsets.only(top:32),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     GestureDetector(
                       onTap:_abrirEmpresa,
                       child: Image.asset("images/menu_empresa.png"),
                     ),
                     GestureDetector(
                       onTap: _abrirServico,
                       child: Image.asset("images/menu_servico.png"),

                     )
                   ],
                 ),
               ),
               Padding(
                 padding: EdgeInsets.only(top:32),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     GestureDetector(
                       onTap:_abrirCliente,
                       child: Image.asset("images/menu_cliente.png"),
                     ),
                     GestureDetector(
                       onTap: _abrirContato,
                       child: Image.asset("images/menu_contato.png"),
                     )
                   ],
                 ),
               ),

             ], 
            ) ,
          
          ) ,
        ),
      );
  }
}