import 'package:flutter/material.dart';


class Triangulo extends StatefulWidget {
  @override
  _TrianguloState createState() => _TrianguloState();
}

class _TrianguloState extends State<Triangulo> {
  TextEditingController _controllerBase = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double base = double.tryParse(_controllerBase.text);
    double altura = double.tryParse(_controllerAltura.text);

    if(base==null ||altura==null){
      setState(() {
        _textoResultado = "Número inválido,digite números maiores que 0 e utilizando (.)";
      });
    }else{
      var area = (base*altura)/2; 
      setState(() {
        _textoResultado = "Área do triângulo: ${area.toString()}";  
      });
    }
    _limparCampos();
  }

  void _limparCampos(){
    _controllerBase.text = "";
    _controllerAltura.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Descubra a área do triângulo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20,bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Base",
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                  controller:_controllerBase,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20,bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Altura",
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                  controller:_controllerAltura,
                ),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.lightBlue,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Calcular",
                  style: TextStyle(fontSize:20),
                ),
                onPressed: _calcular,
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ) ,
    );
  }
}