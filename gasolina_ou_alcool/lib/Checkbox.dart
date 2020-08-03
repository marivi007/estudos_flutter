import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {

  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children:<Widget>[
            CheckboxListTile(
              title: Text("Comida Brasileira"),
              subtitle: Text("A mehlor comida do mundo!!"),
              //activeColor: Colors.red,//cor do check
              //secondary: Icon(Icons.add_box),//icone para o check
              value: _comidaBrasileira,
              onChanged:(bool valor){
                setState(() {
                  _comidaBrasileira = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida Mexicana"),
              subtitle: Text("A mehlor comida do mundo!!"),
              //activeColor: Colors.red,//cor do check
              //secondary: Icon(Icons.add_box),//icone para o check
              value: _comidaMexicana,
              onChanged:(bool valor){
                setState(() {
                  _comidaMexicana = valor;
                });
              },
            ),
            RaisedButton(
              child: Text(
                      "Salvar",
                      style: TextStyle(
                        fontSize:20,
                      ),
              ),
              onPressed: (){
                print("Comida Barsileira: "+_comidaBrasileira.toString()+" Comida Mexicana: "+_comidaMexicana.toString());
              }
            ),
            /* Text("Comida Brasileira"),
              Checkbox(
                value:_estaSelecionado,
                onChanged:(bool valor){
                  setState(() {
                    _estaSelecionado = valor;
                    print("Checkbox: "+valor.toString());
                  });
                
                },
              ),*/
          ],
        ),
      ),
    );
  }
}