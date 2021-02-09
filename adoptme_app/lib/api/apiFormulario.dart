import 'dart:convert';
import 'package:adoptme_app/modelos/mascota.dart';
import 'package:flutter/cupertino.dart';

import '../modelos/formAdopcion.dart';
import 'package:http/http.dart' as http;

class FormProvider {

  Future<bool> insertarFormulario(FormAdopcion formulario) async{

    final url="http://10.0.2.2:8000/api/formularios";
    final response = await http.post(url, headers: {"Content-Type":"application/json"},body: json.encode(formulario));
    if(response.statusCode==201){
      return true;
    }
    return false;
  }

  Future<List<FormAdopcion>> obtenerMascotasFormularios(String id) async{

    List<FormAdopcion> formularios = [];
    final url="http://10.0.2.2:8000/api/formularios?search=$id";
    final response = await http.get(url);
    if(response.statusCode==200){
      var datos = json.decode(response.body) as List;
      formularios = datos.map<FormAdopcion>((json) => FormAdopcion.fromJson(json)).toList();
      return formularios;
    }
    return formularios;

  }

  Future<bool> eliminarForm(FormAdopcion form) async {

    final url="http://10.0.2.2:8000/api/formularios/${form.id}";
    final response = await http.delete(url);
    if(response.statusCode==204){
      return true;
    }
    return false;

  }

}