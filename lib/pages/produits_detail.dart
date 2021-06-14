import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:planteplusnew_app/main.dart';

class ProduitDetail extends StatefulWidget {
  final produits_detail_name;
  final produits_detail_namefon;
  final produits_detail_picture;

  ProduitDetail({
    this.produits_detail_name,
    this.produits_detail_namefon,
    this.produits_detail_picture
});
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
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
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
          new Container(
            height: 300.0,
            child: GridTile(child: Container(
              color: Colors.white,
              child: Image.asset(widget.produits_detail_picture),
            ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.produits_detail_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  title: new Text(widget.produits_detail_namefon, style: TextStyle(color: Colors.lightGreen),),
                ),
            ),),
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 5.0)),
              //button1
              Expanded(child: MaterialButton(
                onPressed: (){},
                color: Colors.lightGreen,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("VERTUS"),
                  ),),
              //button2
              Padding(padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 5.0)),
              Expanded(child: MaterialButton(
                onPressed: (){},
                color: Colors.lightGreen,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("POSOLOGIE"),
              ))
            ],
          ),

          Row(
            children: <Widget>[
              //button1
              Expanded(child: MaterialButton(
                onPressed: (){},
                color: Colors.lightGreen,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Acheter"),
              ),),
              new IconButton(icon: Icon(Icons.add_shopping_cart), color: Colors.lightGreen, onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border), color: Colors.lightGreen, onPressed: (){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("dscription de la plante"),
            subtitle: new Text("Le gingembre officinal est une espèce de plantes originaire d'Inde, du genre Zingiber et de la famille des Zingiberaceae dont on utilise le rhizome en cuisine et en médecine traditionnelle. Ce rhizome est une épice très employée dans un grand nombre de cuisines asiatiques, et en particulier dans la cuisine indienne"),
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Nom de la plante :", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.produits_detail_name),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Type de la plante :", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.produits_detail_name),
              ),
            ],
          )
        ],
      ),
    );
  }
}
