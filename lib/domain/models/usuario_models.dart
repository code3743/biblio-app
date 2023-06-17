// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

import 'historial_prestamo_models.dart';
import 'libro_prestamo_models.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  final String nombre;
  final String apellido;
  final String fechaExpiracion;
  final String programa;
  final String multa;
  final int totalLibrosEnPrestamo;
  final int totalLibrosPrestado;
  final List<LibrosPrestado> librosPrestados;
  final List<HistorialPrestamo> historialPrestamos;

  Usuario({
    required this.nombre,
    required this.apellido,
    required this.fechaExpiracion,
    required this.programa,
    required this.multa,
    required this.totalLibrosEnPrestamo,
    required this.totalLibrosPrestado,
    required this.librosPrestados,
    required this.historialPrestamos,
  });

  Usuario copyWith({
    String? nombre,
    String? apellido,
    String? fechaExpiracion,
    String? programa,
    String? multa,
    int? totalLibrosEnPrestamo,
    int? totalLibrosPrestado,
    List<LibrosPrestado>? librosPrestados,
    List<HistorialPrestamo>? historialPrestamos,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        fechaExpiracion: fechaExpiracion ?? this.fechaExpiracion,
        programa: programa ?? this.programa,
        multa: multa ?? this.multa,
        totalLibrosEnPrestamo:
            totalLibrosEnPrestamo ?? this.totalLibrosEnPrestamo,
        totalLibrosPrestado: totalLibrosPrestado ?? this.totalLibrosPrestado,
        librosPrestados: librosPrestados ?? this.librosPrestados,
        historialPrestamos: historialPrestamos ?? this.historialPrestamos,
      );

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        apellido: json["apellido"],
        fechaExpiracion: json["fechaExpiracion"],
        programa: json["programa"],
        multa: json["multa"],
        totalLibrosEnPrestamo: json["totalLibrosEnPrestamo"],
        totalLibrosPrestado: json["totalLibrosPrestado"],
        librosPrestados: List<LibrosPrestado>.from(
            json["librosPrestados"].map((x) => LibrosPrestado.fromJson(x))),
        historialPrestamos: List<HistorialPrestamo>.from(
            json["historialPrestamos"]
                .map((x) => HistorialPrestamo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "fechaExpiracion": fechaExpiracion,
        "programa": programa,
        "multa": multa,
        "totalLibrosEnPrestamo": totalLibrosEnPrestamo,
        "totalLibrosPrestado": totalLibrosPrestado,
        "librosPrestados":
            List<dynamic>.from(librosPrestados.map((x) => x.toJson())),
        "historialPrestamos":
            List<dynamic>.from(historialPrestamos.map((x) => x.toJson())),
      };
}
