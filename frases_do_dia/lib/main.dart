import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,//retirar marca debuger
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases=[
    "frase1: Sei que nada Sei!","frase2: aprendendo com flutter","frase3: Hello world!",
    "frase4: filosofando a filosofia do filsofo"
  ];
  var _fraseGerada = "Clique abaixo para gerar uma frase";

  void _gerarFrase(){
    //0,1,2,3
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() { _fraseGerada = _frases[numeroSorteado];

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do dia'),
        backgroundColor: Colors.green,
      ),
      body: Center(//centraliza conteudo
        child:  Container(
          padding: EdgeInsets.all(16),//espaçamento da borda
         /* width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.amber)
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,//alinhamento horizontal
            crossAxisAlignment: CrossAxisAlignment.center,//alinhamento vertical
            children: <Widget>[
              Image.asset("images/logo.png"),// imagens colocadas na pasta do projeto
              Text(
                "$_fraseGerada",
                textAlign: TextAlign.justify,
                style:TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              RaisedButton(//botao 1
                child: Text("Nova Frase",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.green,
                onPressed: _gerarFrase,
              ),
              RaisedButton(//botao2
                child: Text("Nova Frase1",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.green,
                onPressed: _gerarFrase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
