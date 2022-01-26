import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rickandmorthy/model/model.dart';

class CardHome extends StatefulWidget {

  final List<Character> characters;
  final Function onNextPage;

  const CardHome({
    Key? key,
    required this.onNextPage,
    required this.characters,
  }) : super(key: key);

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300){
        widget.onNextPage();
      }
      
     });
  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Container(
      child: Column(
        children: [
          const _DataSerie(),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              clipBehavior: Clip.antiAlias,
              itemCount:widget.characters.length,
              itemBuilder: (BuildContext context, int index){
                final character = widget.characters[index];
                return Container(
                  height: size.height * 0.18,
                  child: Card(
                    
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      child: Row(
                        children: [
                          _ImageCharacter(characterModel: character),
                          Expanded(
                            child: _InfoCard(
                              characterData: character,
                              characterModel: Character(
                                origin: character.origin,
                                location: character.location,
                                episode: character.episode,
                                gender: character.gender,
                                image: character.image,
                                name: character.name!,
                                status: character.status!,
                                species: character.species!
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      )
    );
  }
}

class _DataSerie extends StatelessWidget {
  
  const _DataSerie({
    Key? key
  }) : super(key : key);

  @override 
  Widget build(BuildContext context){

    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.grey[200],
      child: Column(
        children: [
          Text('La serie en numeros', overflow: TextOverflow.ellipsis,),
          Text('00 Numero de episodios',overflow: TextOverflow.ellipsis,),
          Text('Locations con mas personajes',overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}

class _ImageCharacter extends StatelessWidget {
  final Character characterModel;
  const _ImageCharacter({required this.characterModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
          child: FadeInImage(
            width: 100,
            height: 180,
            image: NetworkImage(characterModel.image!),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
        ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Character characterModel;
  final Character characterData;
  const _InfoCard({
    required this.characterData,
    required this.characterModel, 
    Key? key
  }) : super(key: key);

  final paddingText = const EdgeInsets.only(top: 8, left: 5);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: paddingText,
            child: Text(
              characterModel.name!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              maxLines: 1,
            )),
        Container(
          padding: paddingText,
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: this.characterModel.status == 'Alive'
                    ? Colors.green
                    : Colors.red,
                size: 10,
              ),
              SizedBox(width: 5,),
              Text(
                characterModel.status!,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
            padding: paddingText,
            child: Text(
              characterModel.species!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            )),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'details', arguments: characterModel);
                  },
                  child: Text('Detalle')),
            ),
          ],
        ),
      ],
    );
  }
}
