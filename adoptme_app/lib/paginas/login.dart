import 'package:adoptme_app/api/apiUsuario.dart';
import 'package:adoptme_app/modelos/usuario.dart';
import 'package:adoptme_app/paginas/menu.dart';
import 'package:adoptme_app/paginas/registrar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  static String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  UsuarioProvider provider = UsuarioProvider();
  String _email;
  String _contra;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset("images/logo.png",
                          height: 150.0,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      userTextField(),
                      SizedBox(height: 15,),
                      _passwordtextField(),
                      SizedBox(height: 20.0,),
                      _bottomLogin(),
                      SizedBox(height: 20.0,),
                      _bottomSignUp(),
                    ]
                )
            )
        )
    );
  }

  Widget userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot)
        {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'ejemplo@correo.com',
                  labelText: "Correo Electronico",
                ),
                onChanged: (value) {
                  _email=value;
                }
            ),
          );
        }
    );
  }

  Widget _passwordtextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.fingerprint),
                hintText: 'Contrasena',
                labelText: "Contrasena",
              ),
              onChanged: (value) {
                _contra=value;
              },
            ),
          );
        }
    );
  }

  Widget _bottomLogin(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                child: Text("Iniciar Sesion",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10.0,
              color: Colors.amber,
              onPressed: () async {

                Usuario usuario = await provider.validarUsuario(_email, _contra);
                if(usuario!=null){
                  Route route = MaterialPageRoute(builder: (bc) => Menu(usuario));
                  Navigator.of(context).pushAndRemoveUntil(route, (r)=>false);
                }else{
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error de inicio de sesion"),
                      content: Text("El usuario o la contraseña es incorrecta"),
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
                }
              }
          );
        }
    );
  }

  Widget _bottomSignUp(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                child: Text("Registrar",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10.0,
              color: Colors.amber,
              onPressed: () {
                Route route = MaterialPageRoute(builder: (bc) => RegistrarForm());
                Navigator.of(context).push(route);
              }
          );
        }
    );
  }

}