// To parse this JSON data, do
//
//     final charaterPageResponse = charaterPageResponseFromMap(jsonString);

import 'dart:convert';

import 'model.dart';



class CharaterPageResponse {
    CharaterPageResponse({
        required this.info,
        required this.results,
    });

    Info info;
    List<Character> results;

    factory CharaterPageResponse.fromJson(String str) => CharaterPageResponse.fromMap(json.decode(str));


    factory CharaterPageResponse.fromMap(Map<String, dynamic> json) => CharaterPageResponse(
        info: Info.fromMap(json["info"]),
        results: List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
    );

}

class Info {
    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    int count;
    int pages;
    String next;
    String prev;

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

}

