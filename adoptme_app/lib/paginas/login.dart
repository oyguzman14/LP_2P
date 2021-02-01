import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  static String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
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
              onPressed: () {}
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
              onPressed: () {}
          );
        }
    );
  }

}