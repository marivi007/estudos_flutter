import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double _valor = 0;
  String label = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Entrada de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child:Column(
          children: <Widget>[

            Slider(
              value:_valor,
              min: 0,
              max: 10, 
              label:label,
              divisions: 10,
              activeColor: Colors.red,
              inactiveColor: Colors.deepPurple,
              onChanged: (double novoValor){
                setState(() {
                  _valor = novoValor;
                  label = "Valor selecionado $novoValor";
                });
                print("Valor Selecionado: $novoValor");
              },
            ),

            RaisedButton(
              child: Text(
                "Salvar",
                style:TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: (){
                print("Valor selecionado: $_valor");
              }
            ),
          ],
        
        ),
      ),
    );
  }
}