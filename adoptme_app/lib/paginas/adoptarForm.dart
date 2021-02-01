import 'package:flutter/material.dart';

class AdoptarForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return AdoptarFormState();
  }
}

class AdoptarFormState extends State<AdoptarForm> {

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
      decoration: InputDecoration(labelText: 'Ciudad'),
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
                    _buildEdad(),
                    _buildOcupacion(),
                    SizedBox(height: 10),
                    RaisedButton(
                      child: Text("Ingresar",
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
                            content: Text("Su postulacion ha sido enviada"),
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

              ],
            )
          ),
      ),
    );
  }
}