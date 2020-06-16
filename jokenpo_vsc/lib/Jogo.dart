import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mesagem = "Escolha uma opção abaixo!";
  int somaPonto=0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuario: " + escolhaUsuario);
//exibição da imagem escolhida pelo App
    print("pontuacao: " + somaPonto.toString());

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

//validação do ganhador
// Usuario Ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mesagem = "Você ganhou, parabéns!!";
        if (escolhaUsuario == "pedra" && escolhaApp == "tesoura") {
          this.somaPonto = this.somaPonto + 30;
        } else if (escolhaUsuario == "tesoura" && escolhaApp == "papel") {
          this.somaPonto = this.somaPonto + 20;
        } else if (escolhaUsuario == "papel" && escolhaApp == "pedra") {
          this.somaPonto = this.somaPonto + 10;
        }
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      //App ganhador
      setState(() {
        this._mesagem = "O App ganhou!";
        if (escolhaApp == "pedra" && escolhaUsuario == "tesoura") {
          this.somaPonto = this.somaPonto - 30;
        } else if (escolhaApp == "tesoura" && escolhaUsuario == "papel") {
          this.somaPonto = this.somaPonto - 20;
        } else if (escolhaApp == "papel" && escolhaUsuario == "pedra") {
          this.somaPonto = this.somaPonto - 10;
        }
      });
    } else {
      setState(() {
        this._mesagem = "Ufa! empatou, tente outra vez!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo do Jota_Bytes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          //image

          Image(
            image: this._imagemApp,
          ),
          //text resultado
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 16),
            child: Text(
              this._mesagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "imagens/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "imagens/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "imagens/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 16),
            child: Text(("Pontos: " + this.somaPonto.toString()),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, 
                fontWeight: FontWeight.bold)
                ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 16),
            child: Text(
              "Pontuação:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Pedra: 30 pontos, Tesoura: 20 pontos, Papel: 10 pontos",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
