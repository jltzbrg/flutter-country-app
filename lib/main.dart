import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_country_app/models/country.dart';
import 'package:flutter_country_app/views/list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Country App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/country.json'),
                builder: (context, snapshot) {
                  List<Country> countries = parseJosn(snapshot.data.toString());
                  //TODO: Eine Möglichkeit überlegen, wie man mit isNotEmpty umgehen soll
                  return !countries.isEmpty
                      ? CountyList(country: countries)
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ));
  }

  List<Country> parseJosn(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
