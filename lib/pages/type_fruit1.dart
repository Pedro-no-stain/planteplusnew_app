import 'package:flutter/material.dart';
import 'package:planteplusnew_app/main.dart';
import 'package:planteplusnew_app/pages/produits_detail.dart';
import 'package:planteplusnew_app/bdd_controller/bdd_controller.dart';

import 'package:planteplusnew_app/pages/A_propos.dart';


class Fruit extends StatefulWidget {
  @override
  _FruitState createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
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

        body: FutureBuilder(
            future: BddController().getData(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                );
              if (snapshot.data.length == 0)
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("liste de plante indisponible pour l'instant."),
                      SizedBox(height: 10.0,),
                      Text("Veuillez revenir plus tard."),
                    ],
                  ),
                );
              /*return ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, item){
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),

                )
              }
          )*/
              return ListView.builder(
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  itemBuilder: (context, item) {
                    return ListTile(
                      leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 100,
                            minHeight: 100,
                            maxHeight: 150,
                            maxWidth: 150,),
                          child: Image.file(snapshot.data[item]['image'])
                      ),
                      title: Text(snapshot.data[item]['nomFrplante'],
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(snapshot.data[item]['nomFonplante'],
                          style: TextStyle(
                              color: Colors.lightGreen, fontWeight: FontWeight.bold)
                      ),
                    );
                  }
              );
            }
        )
    );
  }
}
