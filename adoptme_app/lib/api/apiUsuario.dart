import 'dart:convert';
import '../modelos/usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {

  Future<bool> insertarUsuario(Usuario user) async{
    final url="http://10.0.2.2:8000/api/usuarios";
    final response = await http.post(url, headers: {"Content-Type":"application/json"},body: json.encode(user));
    if(response.statusCode==201){
      return true;
    }
    return false;
  }

  Future<Usuario> validarUsuario(String email, String contra) async{
    Usuario user;
    final url="http://10.0.2.2:8000/api/usuarios?search=${email}";
    final response = await http.get(url);
    if(response.statusCode==200){
      var datos = json.decode(response.body) as List;
      if(datos.isEmpty){
        return null;
      }
      user = Usuario.fromJson(datos[0]);
      if (user.contrasenia==contra){
        return user;
      }else{
        return null;
      }
    }
    return null;
  }

}