import 'package:adoptme_app/api/apiUsuario.dart';
import 'package:adoptme_app/modelos/usuario.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class RegistrarForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return RegistrarFormState();
  }
}

class RegistrarFormState extends State<RegistrarForm> {

  UsuarioProvider provider = UsuarioProvider();
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
        _nombre=value;
        return null;
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
        _cedula=value;
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
        _telefono=value;
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
        _correo=value;
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
        _ciudad=value;
        return null;
      } ,
      onSaved: (String value){
        _name: value;
      },
    );
  }

  Widget _buildContrasena(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(labelText: 'Contrasena'),
      validator: (String value){
        if(value.isEmpty){
          return "Este campo es requerido";
        }
        _contra=value;
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildNombre(),
                  _buildCedula(),
                  _buildCorreo(),
                  _buildContrasena(),
                  _buildTelefono(),
                  _buildCiudad(),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text("Registrar",
                    style: TextStyle(color: Colors.blue, fontSize: 16)
                    ),
                    onPressed: () async {
                      if(!_formKey.currentState.validate()){
                        return;
                      }else{
                        Usuario usuario = Usuario(email: _correo, contrasenia: _contra, nombreCompleto: _nombre, cedula: _cedula, telefono: _telefono, ciudad: _ciudad);
                        if(await provider.insertarUsuario(usuario)){
                          Route route = MaterialPageRoute(builder: (bc) => Menu(usuario));
                          Navigator.of(context).pushAndRemoveUntil(route, (r)=>false);
                        }
                      }
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