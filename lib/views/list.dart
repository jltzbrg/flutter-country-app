import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_app/models/country.dart';

class CountyList extends StatelessWidget {
  final List<Country> country;
  CountyList({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: country == null ? 0 : country.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              child: Center(
                  child: Column(
                // Cards ausrichten (horizontal)
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    // Werte auslesen
                    country[index].name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Text(
                    // Werte über die Hauptstädte auslesen
                    "Capital:- " + country[index].capital,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.amber,
                    ),
                  ),
                ],
              )),
              padding: const EdgeInsets.all(15.0),
            ),
          );
        });
  }
}
