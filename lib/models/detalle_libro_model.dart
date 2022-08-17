// To parse this JSON data, do
//
//     final detalleLibro = detalleLibroFromJson(jsonString);

import 'dart:convert';

DetalleLibro detalleLibroFromJson(String str) =>
    DetalleLibro.fromJson(json.decode(str));

String detalleLibroToJson(DetalleLibro data) => json.encode(data.toJson());

class DetalleLibro {
  DetalleLibro({
    required this.imagen,
    required this.resumen,
    required this.detallesDisponibilidad,
  });

  final String imagen;
  final String resumen;
  final List<DetallesDisponibilidad> detallesDisponibilidad;

  factory DetalleLibro.fromJson(Map<String, dynamic> json) => DetalleLibro(
        imagen: json["imagen"],
        resumen: json["resumen"],
        detallesDisponibilidad: List<DetallesDisponibilidad>.from(
            json["detallesDisponibilidad"]
                .map((x) => DetallesDisponibilidad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "resumen": resumen,
        "detallesDisponibilidad":
            List<dynamic>.from(detallesDisponibilidad.map((x) => x.toJson())),
      };
}

class DetallesDisponibilidad {
  DetallesDisponibilidad({
    required this.codigo,
    required this.localizacion,
    required this.estante,
    required this.signatura,
    required this.coleccion,
    required this.estado,
    required this.categoria,
  });

  final String codigo;
  final String localizacion;
  final String estante;
  final String signatura;
  final String coleccion;
  final String estado;
  final String categoria;

  factory DetallesDisponibilidad.fromJson(Map<String, dynamic> json) =>
      DetallesDisponibilidad(
        codigo: json["codigo"],
        localizacion: json["localizacion"],
        estante: json["estante"],
        signatura: json["signatura"],
        coleccion: json["coleccion"],
        estado: json["estado"],
        categoria: json["categoria"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "localizacion": localizacion,
        "estante": estante,
        "signatura": signatura,
        "coleccion": coleccion,
        "estado": estado,
        "categoria": categoria,
      };
}
