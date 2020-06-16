import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 // inicialização de variaveis
  int _contador = 0;
  String _texto2="";
  String _texto = "";
  String nume1 = "  ";
  String nume2 = "  ";
  String nume3 = "  ";
  String nume4 = "  ";
  String nume5 = "  ";
  String nume6 = "  ";
  String nume7 = "  ";
  String nume8 = "  ";
  String nume9 = "  ";
  int bloco1 = 1;
  int bloco2 = 2;
  int bloco3 = 3;
  int bloco4 = 4;
  int bloco5 = 5;
  int bloco6 = 6;
  int bloco7 = 7;
  int bloco8 = 8;
  String bloco9 = "  ";
  String aux;
  var iterable = [];

  void _listar() {
    //gerando os numeros aleatorios para os blocos
    iterable = [];
    for (int i = 1; i <= 8; i++) {
      int x = Random().nextInt(i);
      iterable.insert(x, i);
    }
    setState(() {
      //atribuindo os numeros aleatorios aos blocos
      bloco1 = iterable[0];
      bloco2 = iterable[1];
      bloco3 = iterable[2];
      bloco4 = iterable[3];
      bloco5 = iterable[4];
      bloco6 = iterable[5];
      bloco7 = iterable[6];
      bloco8 = iterable[7];
      //tornando os blocos para strings
      nume1 = bloco1.toString();
      nume2 = bloco2.toString();
      nume3 = bloco3.toString();
      nume4 = bloco4.toString();
      nume5 = bloco5.toString();
      nume6 = bloco6.toString();
      nume7 = bloco7.toString();
      nume8 = bloco8.toString();
      nume9 = bloco9.toString();
      _contador = 0;
      _texto = _contador.toString();
      print(iterable);
      _texto2 = "";
    });
  }

/*/void _movimento() {
   movimento1                          movimento2                     movimento3   
     nume1;  nume2;              nume1;  nume2; nume3;                nume2; nume3; 
     nume4;                                                                  nume6;
      
//   movimento4                          movimento5                     movimento6   
     nume1;                               nume2;                          nume3;                                             
     nume4;                               nume5;                          nume6;
     nume7;                               nume8;                          nume9;

//   movimento7                          movimento8                     movimento9  
     nume4;                                                               nume6;
     nume7; nume8;                  nume7; nume8;nume9;             nume8;nume9;
/** */
verificar se o espaço esta vazio para mover a peça
senao nao troca
*/
//movimento1 se if(e.getSource()==b1)

  void _ganhou() {// verifica o estado dos blocos
    if (nume1 == "1" &&
        nume2 == "2" &&
        nume3 == "3" &&
        nume4 == "4" &&
        nume5 == "5" &&
        nume6 == "6" &&
        nume7 == "7" &&
        nume8 == "8" &&
        nume9 == "  " ||nume1 == "1" &&
        nume2 == "2" &&
        nume3 == "3" &&
        nume4 == "8" &&
        nume5 == "  " &&
        nume6 == "4" &&
        nume7 == "7" &&
        nume8 == "6" &&
        nume9 == "5" || nume1 == "  " &&
        nume2 == "1" &&
        nume3 == "2" &&
        nume4 == "3" &&
        nume5 == "4" &&
        nume6 == "5" &&
        nume7 == "6" &&
        nume8 == "7" &&
        nume9 == "8") {
      print("Vc ganhou");
      setState(() {//mostrar texto 
        _texto2 = "Você ganhou!! ";
      });
    } else if (nume1 == "1" &&
        nume2 == "2" &&
        nume3 == "3" &&
        nume4 == "4" &&
        nume5 == "5" &&
        nume6 == "6" &&
        nume7 == "8" &&
        nume8 == "7" &&
        nume9 == "  ") {
      print("Vc perdeu, listar novamente!");
      setState(() {//mostrar texto 
        _texto2 = "Você  perdeu, listar novamente! ";
      });
    } else {
      setState(() {//contador do número de movimentos
        _contador = _contador + 1;
        _texto = _contador.toString();
      });
    }
  }

  void _movimento1() {
    //movimento1
    setState(() {
          if (nume1 != "  ") {
        aux = nume1;
        if (nume2 == "  ") {
          nume2 = aux;
          nume1 = "  ";
        } else if (nume4 == "  ") {
          nume4 = aux;
          nume1 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume1);
    });
  }

  void _movimento2() {
    //movimento2
    setState(() {
           if (nume2 != "  ") {
        aux = nume2;
        if (nume1 == "  ") {
          nume1 = aux;
          nume2 = "  ";
        } else if (nume3 == "  ") {
          nume3 = aux;
          nume2 = "  ";
        } else if (nume5 == "  ") {
          nume5 = aux;
          nume2 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume2);
    });
  }

  void _movimento3() {
    //movimento3
    setState(() {
      if (nume3 != "  ") {
        aux = nume3;
        if (nume2 == "  ") {
          nume2 = aux;
          nume3 = "  ";
        } else if (nume6 == "  ") {
          nume6 = aux;
          nume3 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume3);
    });
  }

  void _movimento4() {
    //movimento4
    setState(() {
      if (nume4 != "  ") {
        aux = nume4;
        if (nume1 == "  ") {
          nume1 = aux;
          nume4 = "  ";
        } else if (nume7 == "  ") {
          nume7 = aux;
          nume4 = "  ";
        } else if (nume5 == "  ") {
          nume5 = aux;
          nume4 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume4);
    });
  }

  void _movimento5() {
/*   movimento5   24568  
   2
  456
   8  */
    setState(() {
      if (nume5 != "  ") {
        aux = nume5;
        if (nume2 == "  ") {
          nume2 = aux;
          nume5 = "  ";
        } else if (nume4 == "  ") {
          nume4 = aux;
          nume5 = "  ";
        } else if (nume6 == "  ") {
          nume6 = aux;
          nume5 = "  ";
        } else if (nume8 == "  ") {
          nume8 = aux;
          nume5 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume5);
    });
  }

  void _movimento6() {
    //   movimento6
    setState(() {
        if (nume6 != "  ") {
        aux = nume6;
        if (nume3 == "  ") {
          nume3 = aux;
          nume6 = "  ";
        } else if (nume9 == "  ") {
          nume9 = aux;
          nume6 = "  ";
        } else if (nume5 == "  ") {
          nume5 = aux;
          nume6 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume6);
    });
  }

  void _movimento7() {
    //   movimento7
    setState(() {
      if (nume7 != "  ") {
        aux = nume7;
        if (nume4 == "  ") {
          nume4 = aux;
          nume7 = "  ";
        } else if (nume8 == "  ") {
          nume8 = aux;
          nume7 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume7);
    });
  }

  void _movimento8() {
    //   movimento8
    setState(() { 
      if (nume8 != "  ") {
        aux = nume8;
        if (nume7 == "  ") {
          nume7 = aux;
          nume8 = "  ";
        } else if (nume9 == "  ") {
          nume9 = aux;
          nume8 = "  ";
        } else if (nume5 == "  ") {
          nume5 = aux;
          nume8 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume8);
    });
  }

  void _movimento9() {
    //movimento9
    setState(() {
      if (nume9 != "  ") {
        aux = nume9;
        if (nume6 == "  ") {
          nume6 = aux;
          nume9 = "  ";
        } else if (nume8 == "  ") {
          nume8 = aux;
          nume9 = "  ";
        }
      }
      _ganhou();// verifica se ganhou
      print(nume9);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromRGBO(100, 200, 200, 1),
      appBar: AppBar(
        title: Text("Puzzle Eight 8"),//titulo
      ),
      body: SingleChildScrollView(
        child: Container(alignment: Alignment.center,
          color: Colors.blueGrey[100],
          margin: EdgeInsets.all(5),
          child: Column( 
            children: <Widget>[
              Text(
                "Sistemas de informação",
                style: TextStyle(fontSize: 15),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _movimento1(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume1,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    onTap: () => _movimento2(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume2,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    onTap: () => _movimento3(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume3,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _movimento4(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume4,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    onTap: () => _movimento5(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume5,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    onTap: () => _movimento6(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume6,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _movimento7(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume7,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    onTap: () => _movimento8(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume8,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    onTap: () => _movimento9(),//verifica movimento
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 200, 200, 1)),
                      child: Text(
                        nume9,
                        style: TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: <Widget>[
                      RaisedButton(
                          child: Text("Aqui Chamar Algoritmo"),
                          onPressed: () {}),
                      RaisedButton(
                          child: Text("Listar Numeros"), onPressed: _listar),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: <Widget>[
                      Text(
                        " Numero de passos: $_texto",// mostrar número de passos
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                   Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: <Widget>[//mostrar números dos blocos na tela                      
                      Text(" Posições: $nume1 | $nume2 | $nume3 "
                          " | $nume4 | $nume5| $nume6 | $nume7"
                          " | $nume8 | $nume9|",
                        style: TextStyle(fontSize: 20)),
                    ]
                  ),
                  Row(children: <Widget>[
                    Text(_texto2,style: TextStyle(fontSize: 20)),
                  ],)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
