import 'package:flutter/material.dart';

class RegistrarForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return RegistrarFormState();
  }
}

class RegistrarFormState extends State<RegistrarForm> {

  String _nombre;
  String _cedula;
  String _correo;
  String _telefono;
  String _ciudad;
  String _contra;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNombre(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }

  Widget _buildCedula(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Cedula"),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
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
      } ,
      onSaved: (String value){
        _name: value;
      },
    );return null;
  }
  Widget _buildCiudad(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Direccion'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
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
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }
  Widget _buildContrasena(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contrasena'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNombre(),
                _buildCedula(),
                _buildTelefono(),
                _buildCorreo(),
                _buildCiudad(),
                _buildContrasena(),

                SizedBox(height: 10),
                RaisedButton(
                  child: Text("Registrar",
                  style: TextStyle(color: Colors.blue, fontSize: 16)
                  ),
                  onPressed: () {
                    if(!_formKey.currentState.validate()){
                      return;
                    }
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Datos guardados"),
                        content: Text("Se ha realizado el registro con exito"),
                        actions: <Widget>[
                          FlatButton(
                              child: Text("Ok"),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                          ),
                        ],
                      ),
                    );

                  },
                )
              ],
            ),
          ),
      ),
    );
  }
}