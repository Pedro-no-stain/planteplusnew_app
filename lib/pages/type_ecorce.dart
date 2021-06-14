import 'package:flutter/material.dart';
import 'package:planteplusnew_app/main.dart';
import 'package:planteplusnew_app/pages/produits_detail.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';

import 'package:planteplusnew_app/pages/A_propos.dart';

class ecorce extends StatefulWidget {
  @override
  _ecorceState createState() => _ecorceState();
}

class _ecorceState extends State<ecorce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new Home()),);},
            child: new Text('Plantes utiles')),
        actions: <Widget>[
          //new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
          //new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){}),
        ],
        centerTitle: true,
        elevation: 10.0,
        backgroundColor: Colors.lightGreen,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //       header
            new UserAccountsDrawerHeader(accountName: Text('Plante plus'),
              accountEmail: Text('Planteplus@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.lightGreen
              ),
            ),
            //       body
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> new Home()),),
              child: ListTile(
                title: Text('Page d\'accueil'),
                leading: Icon(Icons.home, color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mon compte'),
                leading: Icon(Icons.person, color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mes commandes'),
                leading: Icon(Icons.shopping_basket, color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: ()=> Navigator.of(context).push( new MaterialPageRoute(builder: (context) => new ProduitDetail())),
              child: ListTile(
                title: Text('type de plantes'),
                leading: Icon(Icons.dashboard, color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Paniers'),
                leading: Icon(Icons.shopping_cart, color: Colors.lightGreen,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mes favories'),
                leading: Icon(Icons.favorite, color: Colors.lightGreen,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('paramètre'),
                leading: Icon(Icons.settings, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: ()=>Navigator.of(context).push( new MaterialPageRoute(builder: (context)=>A_propos(),),),
              child: ListTile(
                title: Text('À propos'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),

      body: ListView(
        children: <Widget>[
        ],
      ),
    );
  }
}
