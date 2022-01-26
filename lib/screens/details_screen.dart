import 'package:flutter/material.dart';
import 'package:rickandmorthy/model/model.dart';


class DetailScreen extends StatelessWidget {


  
  const DetailScreen({
    Key ? key,

  }) : super(key : key);

  @override 
  Widget build(BuildContext context){
    
    //Mando la información del personaje por los argumentos de la ruta
    final Character character = ModalRoute.of(context)!.settings.arguments as Character;
    print(character.fullImage);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/titleRyM.png', height: 50,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 90),
        child: Card(
          color: Colors.grey[200],
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Detalle', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 200,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: FadeInImage(
                      image: NetworkImage(character.image!),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      fadeInDuration: const Duration(milliseconds: 300),
                      
                      
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    character.name!, 
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:10, left: 50),
                  alignment: Alignment.topLeft,
                  child: _DetailsCard(),
                )
              ],
            ),
        ),
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget{

  
  
  @override 
  Widget build(BuildContext context){

    final Character character = ModalRoute.of(context)!.settings.arguments as Character;
    
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
            'Genero: ',
          style: TextStyle(fontSize: 15),
          ),
        Text(
            'origin: ',
            style: TextStyle(fontSize: 15),
        ),
        Text(
            'Localización: ',
            style: TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
        ),
        Text(
            'Numero de episodios: ',
            style: TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

}