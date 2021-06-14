import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:planteplusnew_app/main.dart';
import 'package:planteplusnew_app/composants/horizontal_listview.dart';
import 'package:planteplusnew_app/pages/produits_detail.dart';

class A_propos extends StatefulWidget {
  @override
  _A_proposState createState() => _A_proposState();
}

class _A_proposState extends State<A_propos> {
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
              onTap: (){},
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
          Padding(padding: EdgeInsets.all(5.0)),
          new Container(
            height: 80.0,
            child: new Text("cette Application a été crée pour ma soutenance de fin de formation en licence Option science et technique filière Système Informatiaue et Logiciel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
          ),
          Divider(),
          new Container(
            height: 20.0,
            child: new Text("NOM : Planteplus", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
          ),
          Divider(),
          new Container(
            height: 20.0,
            child: new Text("VERSION : 1.0.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
          ),
          Divider(),
          new Container(
            height: 20.0,
            child: new Text("DÉVELOPPEIR : Juste Pedro DOGBLE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
          ),
          Divider(),
          new Container(
            height: 40.0,
            child: new Text("SYSTÈME D\'EXPLOTATION PRISE EN CHARGE : Android & iOS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
          ),
          Divider(),
          new Container(
            height: 20.0,
            child: new Text("COMPATIBILITÉ : iOS 14 et Android 4.1.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
          ),
          Divider(),
        ],
      ),
    );
  }
}