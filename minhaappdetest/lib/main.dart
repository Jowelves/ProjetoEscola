import 'package:flutter/material.dart';

void main(){
  runApp(MinhaApp());
      }
  
  class MinhaApp extends StatelessWidget{
      @override
  Widget build(BuildContext context) {
      return MaterialApp(
      home: Scaffold(  
        appBar: AppBar(
          title:Text('Titulo da app'),
        ),
          body: Text('hello word')
      )  
        );
  }
}