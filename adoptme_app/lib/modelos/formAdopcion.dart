import 'dart:convert';

FormAdopcion formAdopcionFromJson(String str) => FormAdopcion.fromJson(json.decode(str));

String formAdopcionToJson(FormAdopcion data) => json.encode(data.toJson());

class FormAdopcion {
  FormAdopcion({
    this.id,
    this.nombre,
    this.telefono,
    this.email,
    this.ciudad,
    this.ocupacion,
    this.edad,
    this.idUser,
    this.idMascota,
  });

  int id;
  String nombre;
  String telefono;
  String email;
  String ciudad;
  String ocupacion;
  int edad;
  int idUser;
  int idMascota;

  factory FormAdopcion.fromJson(Map<String, dynamic> json) => FormAdopcion(
    id: json["id"],
    nombre: json["nombre"],
    telefono: json["telefono"],
    email: json["email"],
    ciudad: json["ciudad"],
    ocupacion: json["ocupacion"],
    edad: json["edad"],
    idUser: json["id_user"],
    idMascota: json["id_mascota"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "telefono": telefono,
    "email": email,
    "ciudad": ciudad,
    "ocupacion": ocupacion,
    "edad": edad,
    "id_user": idUser,
    "id_mascota": idMascota,
  };
}
