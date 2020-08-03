import "package:flutter/material.dart";

class AlcoolOuGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
      double precoAlcool = double.tryParse(_controllerAlcool.text);
      double precoGasolina = double.tryParse(_controllerGasolina.text);
      if(precoAlcool==null || precoGasolina==null){
        setState(() {
          _textoResultado = "Número inválido,digite números maiores que 0 e utilixando (.)";
        });
      }else{
          if((precoAlcool/precoGasolina)>=0.7){
            setState(() {
              _textoResultado = "Melhor abastecer com Gasolina";
            });
          }else{
            setState(() {
              _textoResultado = "Melhor abastecer com alcool";  
            });
            
          }
          _limparCampos();
      }
    
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child:SingleChildScrollView(
            child:Padding(
              padding: EdgeInsets.all(32),
              child:Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:<Widget>[
                    //imagem
                    Image.asset("image/logo.png"),
                    //texto
                    Text(
                      "Saiba qual melhor opção para o abastecimento do seu carro",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top:20,bottom:20),
                      //campos
                      child:
                        TextField(
                        keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText:"Preço Alcool",
                            hintStyle: TextStyle(fontSize:20),
                          ),
                        controller: _controllerAlcool,
                        ),
                    ),
                  //campos
                  TextField(
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText:"Preço Gasolina",
                        hintStyle: TextStyle(fontSize:20),
                      ),
                      controller: _controllerGasolina,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:10),
                      child:
                          RaisedButton(
                          textColor: Colors.white,
                          color:Colors.blue,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Calcular",
                            style: TextStyle(fontSize:20),
                          ) ,
                          onPressed:_calcular,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        _textoResultado,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ) ,
            ),
        ),
        
      ),
    );
  }
}