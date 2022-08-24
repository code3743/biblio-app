// To parse this JSON data, do
//
//     final busqueda = busquedaFromJson(jsonString);

import 'dart:convert';

Busqueda busquedaFromJson(String str) => Busqueda.fromJson(json.decode(str));

String busquedaToJson(Busqueda data) => json.encode(data.toJson());

class Busqueda {
  Busqueda({
    required this.resultados,
  });

  final List<Resultado> resultados;

  factory Busqueda.fromJson(Map<String, dynamic> json) => Busqueda(
        resultados: List<Resultado>.from(
            json["resultados"].map((x) => Resultado.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultados": List<dynamic>.from(resultados.map((x) => x.toJson())),
      };
}

class Resultado {
  Resultado({
    required this.imagen,
    required this.id,
    required this.nombre,
    required this.autor,
    required this.isbn,
    required this.detalle,
    required this.ejemplares,
  });

  final String imagen;
  final String id;
  final String nombre;
  final String autor;
  final String isbn;
  final String detalle;
  final String ejemplares;

  factory Resultado.fromJson(Map<String, dynamic> json) => Resultado(
        imagen: json["imagen"],
        id: json["id"],
        nombre: json["nombre"],
        autor: json["autor"],
        isbn: json["ISBN"],
        detalle: json["detalle"],
        ejemplares: json["ejemplares"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "id": id,
        "nombre": nombre,
        "autor": autor,
        "ISBN": isbn,
        "detalle": detalle,
        "ejemplares": ejemplares,
      };
}
