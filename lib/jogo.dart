import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = const AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];  //opcoes que o app vai ter
    var numero = Random().nextInt(3);   //Gerar numero aleatório pro app
    var escolhaApp = opcoes[numero];  //Escolha aleatória do app


    //Exibição da imagem escolhida pelo app
    switch(escolhaApp){
      case "pedra" :
        setState(() {
          _imagemApp = const AssetImage("images/pedra.png");
        });
        break;

      case "papel" :
        setState(() {
          _imagemApp = const AssetImage("images/papel.png");
        });
        break;

      case "tesoura" :
        setState(() {
          _imagemApp = const AssetImage("images/tesoura.png");
        });
        break;
    }

    //Validação do ganhador

      // Usuario ganha
    if(
            (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
            (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
            (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        _mensagem = "Parabéns!! Você venceu.";
      });


      // App ganha
    }else if(
            (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
            (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
            (escolhaApp == "tesoura" && escolhaUsuario == "papel")
    ){
      setState(() {
        _mensagem = "Você perdeu.";
      });

    }else{
      setState(() {
        _mensagem = "Empate!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokenpo"),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1) texto
          //2) imagem
          //3) texto resultado
          //4) 3 imagens

          const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),

              child: Text(
                  "Escolha do app: ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
          ),

         Image(image: _imagemApp),

           Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra"),  // Void não aceitava aqui (estrutura _opcaoSelecionada) então precisa passar uma função anonima e retornar _opcaoSelecionada "()=>"
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
