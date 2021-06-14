import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:planteplusnew_app/main.dart';
import 'package:planteplusnew_app/pages/A_propos.dart';

class ProduitDetail extends StatefulWidget {
  @override
  _ProduitDetailState createState() => _ProduitDetailState();
}

class _ProduitDetailState extends State<ProduitDetail> {
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
          new Container(
            height: 550.0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Category(
                  image_location: 'img/dessin/feuille.png',
                  image_caption: 'feuille',
                ),
                Divider(),
                Category(
                  image_location: 'img/dessin/fleur.jpg',
                  image_caption: 'fleur',
                ),
                Divider(),
                Category(
                  image_location: 'img/dessin/fruit.png',
                  image_caption: 'fruit',
                ),
                Divider(),
                Category(
                  image_location: 'img/dessin/ecorce.jpg',
                  image_caption: 'écorce',
                ),
                Divider(),
                Category(
                  image_location: 'img/dessin/arbre.jpg',
                  image_caption: 'arbre',
                ),
                Divider(),
                Category(
                  image_location: 'img/dessin/autres.jpg',
                  image_caption: 'autre',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location, width: 100.0, height: 50.0,),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption, style: new TextStyle(fontSize: 12.0),)
            ),
          ),
          decoration: BoxDecoration(border: Border.all(
            width: 1,
            color: Colors.lightGreen,),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),);
  }
}