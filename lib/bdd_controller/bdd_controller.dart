import 'package:flutter/material.dart';
//import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';

class BddController {
  Future <List<dynamic>> getData() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      //user: 'pedro_juste',
      user: 'root',
      db: 'gespante',
      //password: 'la fille du 25 mars',
      password: '',
    ));


    var results = await conn.query(
        'SELECT * FROM plante'
        //'SELECT * FROM plante WHERE codetype = "Fe"'
    );

    return results.toList();
  }
}