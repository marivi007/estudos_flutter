import 'package:flutter/material.dart';

class SwicthButton extends StatefulWidget {
  @override
  _SwicthButtonState createState() => _SwicthButtonState();
}

class _SwicthButtonState extends State<SwicthButton> {
  bool _escolhaUsuario = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Entrada de Dados"),
      ),
      body:Container(
        child:Column(
          children: <Widget>[

            SwitchListTile(
              title: Text("Receber notificações?"),
              value: _escolhaUsuario, 
              onChanged: (bool valor)
              {
                setState(() {
                  _escolhaUsuario = valor;
                });
              }
            ),
            RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                          fontSize:20
                        ),
              ),
              onPressed:(){
                print("Resultado: $_escolhaUsuario ");
              }
            ),


            /*Switch(
              value: _escolhaUsuario, 
              onChanged: (bool valor){
                  setState(() {
                    _escolhaUsuario = valor;
                  
                  });
                  print("estado: $_escolhaUsuario");
              }
            ),
            Text("Receber notificações?"),
            */
          ],
        )
      )
    );
  }
}