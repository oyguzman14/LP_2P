import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.id,
    this.email,
    this.contrasenia,
    this.nombreCompleto,
    this.cedula,
    this.telefono,
    this.ciudad,
  });

  int id;
  String email;
  String contrasenia;
  String nombreCompleto;
  String cedula;
  String telefono;
  String ciudad;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json["id"],
    email: json["email"],
    contrasenia: json["contrasenia"],
    nombreCompleto: json["nombre_completo"],
    cedula: json["cedula"],
    telefono: json["telefono"],
    ciudad: json["ciudad"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "contrasenia": contrasenia,
    "nombre_completo": nombreCompleto,
    "cedula": cedula,
    "telefono": telefono,
    "ciudad": ciudad,
  };
}
