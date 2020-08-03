import "package:flutter/material.dart";
import 'dart:math';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print(escolhaApp);
    print(escolhaUsuario);

    switch(escolhaApp){
       case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
        case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
        case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    //Validação do ganhador
    //App ganhador
    if(
      (escolhaUsuario=="pedra" && escolhaApp=="papel")||
      (escolhaUsuario=="papel" && escolhaApp=="tesoura")||
      (escolhaUsuario=="tesoura" && escolhaApp=="pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu :( ";
      });
    }else if(
              (escolhaApp=="pedra" && escolhaUsuario=="papel")||
              (escolhaApp=="papel" && escolhaUsuario=="tesoura")||
              (escolhaApp=="tesoura" && escolhaUsuario=="pedra")
    ){
      setState(() {
        this._mensagem = "Parabéns!!!Você ganhou :)";
      });

    }else{
      setState(() {
        this._mensagem = "Empate :/";
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("JokenPo"),
      ) ,
      body:Center(
        child:
              Column(
                  children: <Widget>[
                    //text
                    Padding(
                      padding: EdgeInsets.only(top:32,bottom: 16),
                      child: Text(
                        "Escolha do App",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.bold,
                        ),
                      ),
                    ),
                    //imagem
                    Image(image: this._imagemApp,),
                    //text resultado
                    Padding(
                      padding: EdgeInsets.only(top:32,bottom:16),
                      child: Text(
                        this._mensagem,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    //Linha 3 imagens
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: ()=> _opcaoSelecionada("pedra"),
                          child: Image.asset("images/pedra.png",height:100,) ,
                        ),
                        GestureDetector(
                          onTap: ()=> _opcaoSelecionada("papel"),
                          child:Image.asset("images/papel.png",height:100,) ,
                        ),
                        GestureDetector(
                          onTap: ()=>_opcaoSelecionada("tesoura") ,
                          child:Image.asset("images/tesoura.png",height:100,) ,
                        ),
                        
                        
                      ],
                    )
                  ],
              ),
      ),
    );
  }
}