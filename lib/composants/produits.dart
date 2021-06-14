import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planteplusnew_app/pages/produits_detail.dart';

class Produits extends StatefulWidget {
  @override
  _ProduitsState createState() => _ProduitsState();
}

class _ProduitsState extends State<Produits> {
  var produits_list = [
    {
      "name": "gingembre",
      "namefon": "dotê",
      "picture": "img/plantes/gingembre.jpg",

    },
    {
      "name": "citron",
      "namefon": "klé",
      "picture": "img/plantes/citron.jpg",

    },
    {
      "name": "ail",
      "namefon": "ayo",
      "picture": "img/plantes/ail.jpg",

    },
    {
      "name": "artemisia",
      "namefon": "dotê",
      "picture": "img/plantes/artemisia.jpg",

    },
    {
      "name": "avocat",
      "namefon": "avokà",
      "picture": "img/plantes/avocat.jpg",

    },
    {
      "name": "oignon",
      "namefon": "ayoman",
      "picture": "img/plantes/oignon.jpg",

    },
    {
      "name": "garcinia",
      "namefon": "ahowé",
      "picture": "img/plantes/garcinia.jpg",
    },
    {
      "name": "kava",
      "namefon": "kàva",
      "picture": "img/plantes/kava.jpg",

    },
    {
      "name": "laurier",
      "namefon": "aman laurier",
      "picture": "img/plantes/laurier.jpg",

    },
    {
      "name": "moringa",
      "namefon": "kpatin-man",
      "picture": "img/plantes/moringa.jpg",
    },
    {
      "name": "baobab",
      "namefon": "kpassa",
      "picture": "img/plantes/baobab.jpg",

    },
    {
      "name": "Ecorce Manguier",
      "namefon": "amangatin-kpa",
      "picture": "img/plantes/Ecorce_Manguier.jpg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: produits_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Single_prod(
            prod_name: produits_list[index]['name'],
            prod_namefon: produits_list[index]['namefon'],
            prod_picture: produits_list[index]['picture'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_namefon;
  final prod_picture;

  Single_prod({
    this.prod_name,
    this.prod_namefon,
    this.prod_picture,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell( onTap: ()=> Navigator.of(context).push( new MaterialPageRoute(builder: (context) => new ProduitDetail(
              // ici je fais le passe de valeur des produits à chaque page de produit detail
              produits_detail_name: prod_name, produits_detail_namefon: prod_namefon, produits_detail_picture: prod_picture,
            ))),
                child: GridTile(
                  footer:Container(
                    /*color: Colors.white70,
                    child: ListTile(
                      leading: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text("$prod_namefon", style: TextStyle(color: Colors.lightGreen) ,),
                    ),*/
                    color: Colors.white,
                    child: new Row(children: <Widget>[
                      Expanded(
                          child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),),
                      Expanded(
                        child: Text(prod_namefon, style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold),),)
                    ],),
                  ),
                    child: Image.asset(prod_picture,
                      fit: BoxFit.cover,)),
              ),
            ),
          ),
    );
  }
}
