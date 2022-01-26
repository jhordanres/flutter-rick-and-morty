import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:rickandmorthy/providers/character_provider.dart';
import 'package:rickandmorthy/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key ? key}) : super(key : key);

  @override 
  Widget build(BuildContext context){

    final characterProvider = Provider.of<CharacterProvider>(context);

    print(characterProvider.onDisplayCharacter);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/titleRyM.png', height: 50,),
        centerTitle: true,
      ),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: CardHome(
          characters: characterProvider.onDisplayCharacter,
          onNextPage: () => characterProvider.getOnDisplayCharacter()
        )
          
        ),
      );
    
  }
}