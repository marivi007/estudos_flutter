
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefas=[];
  Map<String,dynamic>_ultimaTarefaRemovida = Map();
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File>_getFile() async{
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  //adiciona a tarefa na lista de tarefas
  _salvarTarefa(){
    String textoDigitado = _controllerTarefa.text;
    Map<String,dynamic>tarefa = Map();//inicializa uma variavel tipo objeto
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;
    setState(() {
      _listaTarefas.add(tarefa);
    });
    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  //salva o arquivo
  _salvarArquivo() async{

    var arquivo = await _getFile();

      String dados = json.encode(_listaTarefas);//criar dados
      arquivo.writeAsStringSync(dados);
  }


  _lerArquivo() async
  {
    try{

      final arquivo = await _getFile();
      return arquivo.readAsString();

    }catch(e)
    {
       return null;
    }
  }

  @override
  void initState()
  {
    super.initState();
    _lerArquivo().then((dados){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }


  Widget criarItemLista(context,index)
  {

    //final item = _listaTarefas[index]["titulo"];

    return Dismissible(
      key:Key(DateTime.now().millisecondsSinceEpoch.toString()),//deve ser unica
      direction: DismissDirection.endToStart,
      onDismissed: (direction){

        //recuperar ultimo item excluido
        _ultimaTarefaRemovida = _listaTarefas[index];

        //Remove item da lista
        _listaTarefas.removeAt(index);
        _salvarArquivo();

        //snackbar
        final snackbar = SnackBar(
          duration:Duration(seconds:5),
          content: Text("Tarefa removida!!"),
          action: SnackBarAction(
            label:"Desfazer",
            onPressed: (){
              //inserir novamente item removido na lista 
              setState(() {
                 _listaTarefas.insert(index, _ultimaTarefaRemovida);
              });
              _salvarArquivo();
             
             
            }
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      background: Container(
        color:Colors.red,
        padding:EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ) ,
      ),
      child: CheckboxListTile(
                      title: Text(_listaTarefas[index]['titulo']),
                      value: _listaTarefas[index]['realizada'],
                      onChanged:(valorAlterado){
                        setState(() {
                          _listaTarefas[index]['realizada'] = valorAlterado;  
                        });
                        
                        _salvarArquivo();
                      }
              ),
    
    );
    
    
    
  }



  @override
  Widget build(BuildContext context) {

    //_salvarArquivo();
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas"),backgroundColor: Colors.purple,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child:Icon(Icons.add),
          onPressed: (){
            showDialog(
              context: context,
              builder: (context){
                  return AlertDialog(
                    title: Text("Adicionar Tarefa"),
                    content:TextField(
                      controller: _controllerTarefa,
                      decoration:InputDecoration(
                        labelText: "Digite sua tarefa"
                      ),
                      onChanged: (text){

                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: ()=>Navigator.pop(context),
                        child:Text("Cancelar"),
                      ),
                      FlatButton(
                        onPressed: (){
                          _salvarTarefa();
                          Navigator.pop(context);
                          print("itens: "+_listaTarefas.toString());
                        },
                        child:Text("Salvar"),
                      ),
                    ],
                  );
              }
            );
          }
      ) ,
      body:Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount:_listaTarefas.length ,
              itemBuilder:criarItemLista
            ),
          ),
        ],
      ),
      
      
    );
  }
}