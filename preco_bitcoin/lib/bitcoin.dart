import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitcoinPrice extends StatefulWidget {

  @override
  _BitcoinPriceState createState() => _BitcoinPriceState();
}

class _BitcoinPriceState extends State<BitcoinPrice> {
  String _preco = "0";
  void _atualizar() async
  {
    String url = "https://blockchain.info/ticker";

    http.Response response;//cria um objeto

    response = await http.get(url);
    Map<String,dynamic> retorno = json.decode(response.body);//converter a string para um objeto json
    setState(() {
      _preco = retorno['BRL']['buy'].toString();
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Padding(
          padding:EdgeInsets.all(40),
          child: Column
          (
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/bitcoin.png"),
                Padding(
                  padding:EdgeInsets.only(top: 30,bottom: 20),
                  child: Text(
                    "R\$ "+ _preco,
                    style: TextStyle(
                      fontSize:35
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top:10),
                  child: RaisedButton(
                    onPressed: _atualizar,
                    textColor: Colors.white,
                    color:Colors.orange,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Atualizar",
                      style: TextStyle(fontSize:20),
                    ),
                  ),
                ),
              ],
          ),
              
        ),
        
      ),
    );
  }
}