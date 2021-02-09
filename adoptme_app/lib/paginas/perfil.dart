import 'package:adoptme_app/api/apiFormulario.dart';
import 'package:adoptme_app/api/apiMascota.dart';
import 'package:adoptme_app/modelos/formAdopcion.dart';
import 'package:adoptme_app/modelos/mascota.dart';
import 'package:adoptme_app/modelos/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Perfil extends StatefulWidget {

  Usuario usuario;
  List<String> imagen;

  Perfil(this.usuario, this.imagen);
  @override
  State<StatefulWidget> createState() {
    return PerfilState();
  }
}

class PerfilState extends State<Perfil> {

  List<Mascota> mascotasAdoptar;
  List<Mascota> mascotasAdopcion;
  MascotaProvider providerM;
  FormProvider providerF;

  List<Stack> mascotasA;
  List<Stack> mascotasB;

  PerfilState() {
    mascotasAdoptar = List<Mascota>();
    mascotasAdopcion = List<Mascota>();
    providerM = MascotaProvider();
    providerF = FormProvider();
    mascotasA = [];
    mascotasB = [];
  }

  //Future<List<Stack>>
  void llenarMascotasAdopcion() async{

    mascotasAdopcion = await providerM.getMascotasUser(widget.usuario.id.toString());
    for(var i=0; i<mascotasAdopcion.length; i++){
      mascotasA.add(
        _crearCard2(mascotasAdopcion[i])
      );
    }
  }

  void llenarMascotasAdoptar() async {

    List<FormAdopcion> formularios = await providerF.obtenerMascotasFormularios(widget.usuario.id.toString());
    for(var i=0; i<formularios.length; i++){
      Mascota temp = await providerM.getMascota(formularios[i].idMascota.toString());
      mascotasAdoptar.add(temp);
    }
    for(var j=0 ; j<mascotasAdoptar.length; j++){
      mascotasB.add(
        _crearCard4(mascotasAdoptar[j], formularios[j])
      );
    }
  }

  @override
  void initState() {
     llenarMascotasAdopcion();
     llenarMascotasAdoptar();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
        appBar: AppBar(
          title: Text("Perfil"),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          children: [
            Column(
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
                      mainAxisAlignment: MainAxisAlignment.center, //cambiar
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/perfil.png"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,
                              width: 4,
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
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
                          fit: BoxFit.cover,                        ),
                        Text(widget.usuario.nombreCompleto,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ]
                  ),
                ),
                Padding(padding: EdgeInsets.all(16.0),
                    child: Container(
                      child: Center(
                          child: Column(
                              children: <Widget>[
                                Text(
                                  'Mascotas que has puesto en adopcion:',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                ),
                                Padding(padding: EdgeInsets.all(16.0), child: Column(children:mascotasA,)),
                                Text(
                                  'Mascotas a las que quieres adoptar',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                ),
                                Padding(padding: EdgeInsets.all(16.0), child: Column(children: mascotasB,)),
                              ]
                          )
                      ),
                    ))
              ],
            ),

            Padding(padding: EdgeInsets.all(16.0),
            child: Container(
                  child: Center(
                      child: Column(
                          children: <Widget>[
                            Text(
                              'Mascotas que has puesto en adopcion:',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Padding(padding: EdgeInsets.all(16.0), child: _crearCard2()),
                            Text(
                              'Mascotas a las que quieres adoptar',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Padding(padding: EdgeInsets.all(16.0), child: _crearCard4()),
                          ]
                      )
                  ),
            ))

          ],
        )

    );
  }

  //Creacion de las cartas

  Widget _crearCard2(Mascota m) {
    return Stack(
      children: [
        Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: (m.nombre),
                child: new Material(
                  child: new InkWell(
                    onTap: (){},
                    child: new Image.asset(
                        "images/"+widget.imagen[m.id],
                        height: 200,
                        width: 200,
                        fit: BoxFit.contain
                    ),
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
              new Padding(
                padding: new EdgeInsets.all(5.0),
              ),
              new Text(
                m.nombre,
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                m.edad,
                style: new TextStyle(fontSize: 15.0),
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
            ],
          ),
        ),
        Positioned(
          left: 150,
          child: FloatingActionButton(
            onPressed:() async {
              if(await providerM.eliminarMascota(m)){
                setState(() {
                  // mascotasAdopcion.remove(m);
                  llenarMascotasAdopcion();
                });
              }
            },
            heroTag: m.id,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.delete),
          ),
        )
      ],
    );
  }

  Widget _crearCard4(Mascota m, FormAdopcion form) {
    return Stack(
      children: [
        Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: (m.nombre),
                child: new Material(
                  child: new InkWell(
                    onTap: () {},
                    child: new Image.asset(
                        "images/"+ widget.imagen[m.id],
                        height: 200,
                        width: 200,
                        fit: BoxFit.contain
                    ),
                  ),
        ],
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
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                m.nombre,
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                m.edad,
                style: new TextStyle(fontSize: 15.0),
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),

            ],
          ),
        ),Positioned(
          left: 150,
          child: FloatingActionButton(
            onPressed:() async {
              if( await providerF.eliminarForm(form)) {
                setState(() {
                  llenarMascotasAdoptar();
                  // mascotasAdoptar.remove(m);
                });
              }
            },
            heroTag: m.id,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.delete),
          ),
        )
      ],
    );
  }
}