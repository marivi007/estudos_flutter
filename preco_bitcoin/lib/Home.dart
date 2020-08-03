import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";
 
  _recuperarCep() async{
    String cep = _controllerCep.text;
    String url = "https://viacep.com.br/ws/$cep/json";

    http.Response response;

    response = await http.get(url);
    Map<String,dynamic> retorno = json.decode(response.body);//converter a string para um objeto json
    String logradouro = retorno['logradouro'];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];

    setState(() {
      _resultado ="${logradouro},${complemento},${bairro}";
    });

    print("resposta: "+response.statusCode.toString());//pegar o status da requisição

    print("resposta: "+response.body);//traz a string do objeto
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Consumo de serviço web"),
      ),
      body:Container(
        padding:EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:20,bottom:20),
              //campos
              child:
                TextField(
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText:"CEP",
                    hintStyle: TextStyle(fontSize:20),
                  ),
                controller: _controllerCep,
                ),
            ),
            Text(_resultado),
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            )
          ],
        ),
      )
    );
  }
}