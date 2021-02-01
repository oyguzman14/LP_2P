import 'package:adoptme_app/paginas/adopcionForm.dart';
import 'package:adoptme_app/paginas/adoptarForm.dart';
import 'package:adoptme_app/paginas/perfil.dart';
import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  //Aqui se crea el arreglo de datos de imagenes, nombre, edad y ciudad
  List<Container> listamos = List();

  var arreglox = [
    {"nombre": "Heroe", "imagen": "perrito1.png", "raza": "Labrador", "especie": "Perro", "sexo": "Masculino", "edad": "3 meses", "ciudad": "Guayaquil"},
    {"nombre": "Princesa", "imagen": "perrito2.png", "raza": "Labrador", "especie": "Perro", "sexo": "Femenino","edad": "2 meses", "ciudad": "Cuenca"},
    {"nombre": "Rocky", "imagen": "perrito3.png", "raza": "Pitbull", "especie": "Perro", "sexo": "Masculino","edad": "1 anio", "ciudad": "Ambato"},
    {"nombre": "Dulce", "imagen": "perrito4.png", "raza": "Labrador", "especie": "Perro", "sexo": "Femenino","edad": "11 meses", "ciudad": "Guayaquil"},
    {"nombre": "Fancy", "imagen": "perrito5.png", "raza": "Lassie", "especie": "Perro", "sexo": "Femenino","edad": "1 anio y medio", "ciudad": "Guayaquil"},
    {"nombre": "Japi", "imagen": "gatito1.png", "raza": "Mestizo", "especie": "Gato", "sexo": "masculino","edad": "1 mes", "ciudad": "Zaruma"},
    {"nombre": "Rubio", "imagen": "gatito2.png", "raza": "Mestizo", "especie": "Gato", "sexo": "masculino","edad": "3 meses", "ciudad": "Duran"},
    {"nombre": "Grace", "imagen": "gatito3.png", "raza": "Persa", "especie": "Gato", "sexo": "masculino","edad": "1 anio", "ciudad": "Santa Elena"},
    {"nombre": "Pucca", "imagen": "gatito4.png", "raza": "Siames", "especie": "Gato", "sexo": "masculino","edad": "10 meses", "ciudad": "Santa Elena"},
  ];

  //recorrer el listado

  _listado() async {
    for(var i = 0; i < arreglox.length; i++){
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];

      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: arregloxyz['nombre'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detalle(
                              nombre: arregloxyz["nombre"],
                              imagen: imagen,
                              raza: arregloxyz["raza"],
                              especie: arregloxyz["especie"],
                              sexo: arregloxyz["sexo"],
                              edad: arregloxyz["edad"],
                              ciudad: arregloxyz["ciudad"]
                          ),
                        )),
                    child: new Image.asset(
                        "images/$imagen",
                        fit: BoxFit.contain
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                arregloxyz["nombre"],
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                arregloxyz["edad"],
                style: new TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState(){
    BotonAdoptar();
    _listado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("AdoptMe 2021"), backgroundColor: Colors.orange,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("AdoptMe"),
              accountEmail: new Text("Adopcion de mascotas"),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/header.jpg'),
                  )
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Cuenta"),
              trailing: new Icon(Icons.portrait),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Perfil()
              )),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Dar en adopcion"),
              trailing: new Icon(Icons.assignment_rounded),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => AdopcionForm(),
              )),
            ),
          ],
        ),
      ),
      body:
          new GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0.1,
            childAspectRatio: 0.700,
            children: listamos,
          ),
    );
  }
}

//creamos el metodo detalle
//este se usa cuando pulsamos para ver segunda pantalla la descripcion del ejercicio
class Detalle extends StatelessWidget {
  Detalle({this.nombre, this.imagen, this.raza,this.especie, this.sexo, this.edad,this.ciudad});
  final String nombre;
  final String imagen;
  final String raza;
  final String especie;
  final String sexo;
  final String edad;
  final String ciudad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 387.0,//tamaño de la segunda imagen
              child: new Hero(
                tag: nombre,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "images/$imagen",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new IniciarNombre(
            nombre: nombre,
          ),
          // new Informacion(
          //     raza: raza,
          //     especie: especie,
          //     sexo: sexo,
          //     ciudad: ciudad,
          // ),
          new BotonAdoptar(
          )
        ],
      ),
    );
  }
}

class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre});
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(//icono que agrega estrellas calificacion
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.orange,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.purple,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.raza, this.especie, this.sexo, this.ciudad});
  final String raza;
  final String especie;
  final String sexo;
  final String ciudad;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            raza,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}

class BotonAdoptar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            RaisedButton(
                child: Text("Adoptar",
                    style: TextStyle(color: Colors.orange, fontSize: 16)
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (bc) => AdoptarForm());
                  Navigator.of(context).push(route);
                }
            )
          ],
        ),
      ),
    );
  }
}

