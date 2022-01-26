

import 'dart:convert';

class Character {
    Character({
        this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        required this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created,
    });

    int? id;
    String? name;
    String? status;
    String? species;
    String? type;
    String? gender;
    Location origin;
    Location? location;
    String? image;
    List<String>? episode;
    String? url;
    String? created;

    get fullImage {
      if(this.image != null){
        return 'https://rickandmortyapi.com/api/character/avatar/${this.image}';
      }
      return 'https://i.stack.imgur.com/GNhx0.png';
      
    }

    factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

    factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Location.fromMap(json["origin"]),
        location: Location.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: json["created"],
    );
}

enum Gender { MALE, UNKNOWN, FEMALE, GENDERLESS }

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Genderless": Gender.GENDERLESS,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

class Location {
    Location({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );
}

enum Species { HUMANOID, ALIEN, HUMAN, MYTHOLOGICAL_CREATURE }

final speciesValues = EnumValues({
    "Alien": Species.ALIEN,
    "Human": Species.HUMAN,
    "Humanoid": Species.HUMANOID,
    "Mythological Creature": Species.MYTHOLOGICAL_CREATURE
});

enum Status { DEAD, ALIVE, UNKNOWN }

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Dead": Status.DEAD,
    "unknown": Status.UNKNOWN
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
