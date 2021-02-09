import 'dart:convert';

Mascota mascotaFromJson(String str) => Mascota.fromJson(json.decode(str));

String mascotaToJson(Mascota data) => json.encode(data.toJson());

class Mascota {
  Mascota({
    this.id,
    this.nombre,
    this.raza,
    this.especie,
    this.sexo,
    this.edad,
    this.ciudad,
    this.idUser,
  });

  int id;
  String nombre;
  String raza;
  String especie;
  String sexo;
  String edad;
  String ciudad;
  int idUser;

  factory Mascota.fromJson(Map<String, dynamic> json) => Mascota(
    id: json["id"],
    nombre: json["nombre"],
    raza: json["raza"],
    especie: json["especie"],
    sexo: json["sexo"],
    edad: json["edad"],
    ciudad: json["ciudad"],
    idUser: json["id_user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "raza": raza,
    "especie": especie,
    "sexo": sexo,
    "edad": edad,
    "ciudad": ciudad,
    "id_user": idUser,
  };
}
