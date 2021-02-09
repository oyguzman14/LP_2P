import 'package:adoptme_app/api/apiMascota.dart';
import 'package:adoptme_app/modelos/mascota.dart';
import 'package:adoptme_app/modelos/usuario.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class AdopcionForm extends StatefulWidget {

  Usuario usuario;

  AdopcionForm(this.usuario);

  @override
  State<StatefulWidget> createState(){
    return AdopcionFormState();
  }
}

class AdopcionFormState extends State<AdopcionForm> {

  MascotaProvider provider = MascotaProvider();
  String _nombre;
  String _raza;
  String _especie;
  String _sexo;
  String _edad;
  String _ciudad;
  int id_user;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNombre(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _nombre = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }

  Widget _buildRaza(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Raza'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _raza = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }
  Widget _buildEspecie(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Especie'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _especie = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }
  Widget _buildSexo(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sexo'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _sexo = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );return null;
  }
  Widget _buildEdad(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Edad'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _edad = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }
  Widget _buildCiudad(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ciudad'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _ciudad = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("Datos de la mascota"),
          backgroundColor: Colors.orange,
        ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildNombre(),
                  _buildRaza(),
                  _buildEspecie(),
                  _buildSexo(),
                  _buildEdad(),
                  _buildCiudad(),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text("Registrar",
                    style: TextStyle(color: Colors.blue, fontSize: 16)
                    ),
                    onPressed: () async {
                      if(!_formKey.currentState.validate()){
                        return;
                      }
                      Mascota mascota = Mascota(nombre: _nombre, raza: _raza, especie: _especie, sexo: _sexo, edad: _edad, ciudad: _ciudad, idUser: widget.usuario.id);
                      if(await provider.ingresarMascota(mascota)){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Datos guardados"),
                            content: Text("Sus datos han sido agregados correctamente"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: (){
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Menu(widget.usuario)), (route) => false);
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      // _formKey.currentState.save();
                      // print(_nombre);
                      // print(_raza);
                      // print(_especie);
                      // print(_sexo);
                      // print(_edad);
                      // print(_ciudad);
                    },
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}