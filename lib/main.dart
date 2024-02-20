import 'package:flutter/material.dart';
import 'package:jokenpo/jogo.dart';
import 'package:flutter/services.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);   /* Orientação de tela, nesse caso não
                                                 é possivel girar a tela */

  runApp(const MaterialApp(
    //debugShowCheckedModeBanner: false,
    home: Jogo(),


  ));
}
