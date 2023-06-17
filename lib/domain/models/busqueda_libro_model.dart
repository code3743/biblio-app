// To parse this JSON data, do
//
//     final resultados = resultadosFromJson(jsonString);

import 'dart:convert';

import 'libro_model.dart';

Resultados resultadosFromJson(String str) =>
    Resultados.fromJson(json.decode(str));

String resultadosToJson(Resultados data) => json.encode(data.toJson());

class Resultados {
  final String titulo;
  final int total;
  final List<Libro> libros;

  Resultados({
    required this.titulo,
    required this.total,
    required this.libros,
  });

  Resultados copyWith({
    String? titulo,
    int? total,
    List<Libro>? libros,
  }) =>
      Resultados(
        titulo: titulo ?? this.titulo,
        total: total ?? this.total,
        libros: libros ?? this.libros,
      );

  factory Resultados.fromJson(Map<String, dynamic> json) => Resultados(
        titulo: json["titulo"],
        total: json["total"],
        libros: List<Libro>.from(json["libros"].map((x) => Libro.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "total": total,
        "libros": List<dynamic>.from(libros.map((x) => x.toJson())),
      };
}
