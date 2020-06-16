import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperarPreco(),
      builder: (context, snapshot){
        String resultado;
        
        switch(snapshot.connectionState){
          //quando estado está nulo
          case ConnectionState.none:
         
          //quando o estado está aguardando os dado serem recuperados
          case ConnectionState.waiting:
           print("conexao await");
           resultado = "Carregando...";
           break;
          
          //quando o estado está tem que ficar ativo por um tempo stream
         case ConnectionState.active:
          
          //quando o estado está terminado e recuperou os dados
         case ConnectionState.done:
          print("conexao done");
           if(snapshot.hasError){
            resultado = "Erro ao carregar os dados.";
            }else{
            double valor = snapshot.data["BRL"]["buy"];
            resultado = "Preço do bitcoin: ${valor.toString()}";
          }
           break;
        }
        return Center(child: Text(resultado));
      },
    );
  }
}
