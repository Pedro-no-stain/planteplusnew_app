import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:planteplusnew_app/pages/type_feuille.dart';
import 'package:planteplusnew_app/pages/type_arbre.dart';
import 'package:planteplusnew_app/pages/type_autre.dart';
import 'package:planteplusnew_app/pages/type_ecorce.dart';
import 'package:planteplusnew_app/pages/type_fleur.dart';
import 'package:planteplusnew_app/pages/type_fruit.dart';
import 'package:planteplusnew_app/pages/type_fruit1.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'img/dessin/feuille.png',
            image_caption: 'feuille',
          ),
          Category(
            image_location: 'img/dessin/fleur.jpg',
            image_caption: 'fleur',
          ),
          Category(
            image_location: 'img/dessin/fruit.png',
            image_caption: 'fruit',
          ),
          Category(
            image_location: 'img/dessin/ecorce.jpg',
            image_caption: 'écorce',
          ),
          Category(
            image_location: 'img/dessin/arbre.jpg',
            image_caption: 'arbre',
          ),
          Category(
            image_location: 'img/dessin/autres.jpg',
            image_caption: 'autre',
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
      child: InkWell(onTap: () {
        if (image_caption.contains("feuille")){
          Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => feuille()
            ),
          );

        }
        if (image_caption.contains("fruit")){
          Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => Fruit()
            ),
          );

        }
        if (image_caption.contains("fleur")){
          Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => fleur()
            ),
          );

        }
        if (image_caption.contains("écorce")){
          Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => ecorce()
            ),
          );

        }
        if (image_caption.contains("arbre")){
          Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => arbre()
            ),
          );

        }
        if (image_caption.contains("autre")){
          Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => autre()
            ),
          );

        }
      },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location, width: 100.0, height: 75.0,),
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

