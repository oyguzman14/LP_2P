import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adoptme_app/paginas/menu.dart';



class Perfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PerfilState();
  }
}

class PerfilState extends State<Perfil> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/fondo1.jpg"),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/perfil1.jpg"),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,
                          width: 4,
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 5),
                    ),
                    Text("Alicia Lopez",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ]
              ),
            ),
            new Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    _crearCard1(),
                    _crearCard2(),
                    _crearCard3(),
                    _crearCard4()
                  ]
                )
              )
            )
          ],
        ),

        )
      );
  }

  Widget  _crearCard1() {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Text("Mascotas que has puesto en adopcion",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
          ]
        )
      ),
    );
  }

  Widget _crearCard2() {
    return Card(
      child: new Column(
        children: <Widget>[
          new Hero(
            tag: ('nombre'),
            child: new Material(
              child: new InkWell(
                onTap: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                          nombre: "Princesa",
                          imagen: "images/perrito2.png",
                          raza: "Labrador",
                          especie: "Perro",
                          sexo: "Femenino",
                          edad: "2 meses",
                          ciudad: "Cuenca"
                      ),
                    )),
                child: new Image.asset(
                    "images/perrito2.png",
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain
                ),
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          new Text(
            "Princesa",
            style: new TextStyle(fontSize: 20.0),
          ),
          new Text(
            "2 meses",
            style: new TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }

  Widget _crearCard3() {
    return Card(
      child: Container(
          child: Column(
              children: <Widget>[
                Text("Mascotas a las que quieres adoptar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              ]
          )
      ),
    );
  }

  Widget _crearCard4() {
    return Card(
      child: new Column(
        children: <Widget>[
          new Hero(
            tag: ('nombre1'),
            child: new Material(
              child: new InkWell(
                onTap: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                          nombre: "Grace",
                          imagen: "images/gatito3.png",
                          raza: "Siames",
                          especie: "Gato",
                          sexo: "Femenino",
                          edad: "1 anio",
                          ciudad: "Santa Elena"
                      ),
                    )),
                child: new Image.asset(
                    "images/gatito3.png",
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain
                ),
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          new Text(
            "Grace",
            style: new TextStyle(fontSize: 20.0),
          ),
          new Text(
            "1 anio",
            style: new TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
