import 'package:adoptme_app/api/apiFormulario.dart';
import 'package:adoptme_app/modelos/formAdopcion.dart';
import 'package:adoptme_app/modelos/mascota.dart';
import 'package:adoptme_app/modelos/usuario.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class AdoptarForm extends StatefulWidget {

  Usuario usuario;
  Mascota mascota;

  AdoptarForm(this.usuario, this.mascota);

  @override
  State<StatefulWidget> createState(){
    return AdoptarFormState();
  }
}

class AdoptarFormState extends State<AdoptarForm> {

  FormProvider provider = FormProvider();
  String _nombre;
  String _ocupacion;
  String _correo;
  String _telefono;
  String _ciudad;
  String _edad;

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

  Widget _buildOcupacion(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Ocupacion"),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _ocupacion = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }
  Widget _buildTelefono(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Telefono'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _telefono = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }
  Widget _buildCorreo(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Correo'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _correo = value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );return null;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("Formulario para adopcion"),
          backgroundColor: Colors.orange,
        ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildNombre(),
                    _buildTelefono(),
                    _buildCorreo(),
                    _buildCiudad(),
                    _buildOcupacion(),
                    _buildEdad(),
                    SizedBox(height: 10),
                    RaisedButton(
                      child: Text("Ingresar",
                          style: TextStyle(color: Colors.blue, fontSize: 16)
                      ),
                      onPressed: () async {
                        if(!_formKey.currentState.validate()){
                          return;
                        }
                        FormAdopcion formulario = FormAdopcion(nombre: _nombre, telefono: _telefono, email: _correo, ciudad: _ciudad, ocupacion: _ocupacion, edad: int.parse(_edad), idUser: widget.usuario.id, idMascota: widget.mascota.id);
                        if(await provider.insertarFormulario(formulario)){
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
                      },
                    )
                  ],
                ),
              ],
            )
          ),
      ),
    );
  }
}