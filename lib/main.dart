import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planteplusnew_app/composants/rechercher.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';

// mes importations personnelles
import 'composants/horizontal_listview.dart';
import 'composants/produits.dart';
import 'pages/type_plante.dart';
import 'pages/A_propos.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'PLANTES PLUS',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      debugShowCheckedModeBanner: false,
      //home: new Home(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }

}

class _Home extends State<Home>{
  Future<List> Prendredata() async {
    final res= await http.get("http://localhost/planteplus/prendredata.php");
    return json.decode(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Plantes utiles'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: ()=>Navigator.of(context).push( new MaterialPageRoute(builder: (Context)=>Recherche(),),),),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){}),
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
              onTap: ()=> Navigator.of(context).push( new MaterialPageRoute(builder: (context) => new ProduitDetail(
              // ici je fais le passe de valeur des produits à chaque page de produit detail
              //produits_detail_name: prod_name, produits_detail_namefon: prod_namefon, produits_detail_picture: prod_picture,
            ))),
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
      /*body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 150.0),
          child: Form(
            child: Column(
              children: <Widget>[
                Image.asset('img/logo.png', height: 100.0, width: 100.0),
                SizedBox(height: 20.0),
                //Image.asset('img/images.jpg'),
                //SizedBox(height: 30.0),
                Center(
                  child: Text('Identifier une plante en cliquant sur l\'con en bas ',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                new IconButton(
                    iconSize: 70,
                    icon: new Icon(Icons.add_a_photo),
                    onPressed: null
                ),
              ],
            ),
          ),
        ),

      ),*/
      body: new ListView(
        children: <Widget>[
          /*Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color:Colors.lightGreen.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SvgPicture.asset("assets/icons/search.svg"),
              ],
            ),
          ),*/
          Image.asset('img/logo.png', height: 100.0, width: 100.0),
          SizedBox(height: 4.0),
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0), child: new Text('Type de plantes'),),

          //horizontal listview
          HorizontalList(),

          new Padding(padding: const EdgeInsets.all(18.0), child: new Text('Plante nouvellement ajoutée'),),

          //Grid view
         Container(
            height: 270.0,
            child: Produits(),
          )
          /*Flexible(
            flex: 1,
              child: Produits(),),*/
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 160,
          right: 152,
          bottom: 0,
        ),
        //padding: EdgeInsets.symmetric(0.0, 2.0),
        height: 55,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: Colors.white.withOpacity(0.38),
          ),
          ],
        ),
        child: Row(
          children: <Widget>[
            IconButton(icon: SvgPicture.asset("img/camera.svg"), onPressed: (){})
          ],
        ),
      ),
    );
  }
}