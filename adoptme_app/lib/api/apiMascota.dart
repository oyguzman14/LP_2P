import 'dart:convert';
import '../modelos/mascota.dart';
import 'package:http/http.dart' as http;

class MascotaProvider{

  final url="http://10.0.2.2:8000/api/mascotas";

  Future<List<Mascota>> getMascotasAdopcion() async {

    List<Mascota> mascotas = [];
    final response = await http.get(url);
    if(response.statusCode==200){
      var datos=json.decode(response.body) as List;
      mascotas = datos.map<Mascota>((json) => Mascota.fromJson(json)).toList();
      return mascotas;
    }
    return mascotas;
  }

  Future<List<Mascota>> getMascotasUser(String id) async {

    List<Mascota> mascotas = [];
    final response = await http.get(url+'?search=$id');
    if(response.statusCode==200){
      var datos = json.decode(response.body) as List;
      mascotas = datos.map<Mascota>((json)=> Mascota.fromJson(json)).toList();
      return mascotas;
    }
    return mascotas;
  }


  Future<Mascota> getMascota(String id) async {

    final response = await http.get(url+"/$id");
    if(response.statusCode==200){
      var dato=json.decode(response.body);
      return Mascota.fromJson(dato);
    }
    return null;

  }

  Future<bool> ingresarMascota(Mascota mascota) async {

    final response = await http.post(url, headers: {"Content-Type":"application/json"}, body: json.encode(mascota));
    if(response.statusCode==201){
      return true;
    }
    return false;

  }

  Future<List<Mascota>> filtrarMascotas(String value) async {

    List<Mascota> mascotas = [];
    final response = await http.get(url+'?search=${value}');
    if(response.statusCode==200){
      var datos = json.decode(response.body) as List;
      mascotas = datos.map<Mascota>((json) => Mascota.fromJson(json)).toList();
      return mascotas;
    }
    return mascotas;
  }

  Future<bool> eliminarMascota(Mascota mascota) async {

    final response = await http.delete(url+'/${mascota.id}');
    if(response.statusCode==204){
      return true;
    }
    return false;
  }

}