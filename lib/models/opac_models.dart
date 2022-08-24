import 'dart:convert';

Opac opacFromJson(String str) => Opac.fromJson(json.decode(str));

String opacToJson(Opac data) => json.encode(data.toJson());

class Opac {
  Opac({
    required this.nombre,
    required this.apellido,
    required this.fechaExpiracion,
    required this.multa,
    required this.librosPrestados,
    required this.historialPrestamos,
  });
  final String nombre;
  final String apellido;
  final String fechaExpiracion;
  final String multa;
  final List<LibrosPrestado> librosPrestados;
  final List<HistorialPrestamo> historialPrestamos;

  factory Opac.fromJson(Map<String, dynamic> json) => Opac(
        nombre: json["nombre"],
        apellido: json["apellido"],
        fechaExpiracion: json["fechaExpiracion"],
        multa: json["multa"],
        librosPrestados: List<LibrosPrestado>.from(
            json["librosPrestados"].map((x) => LibrosPrestado.fromJson(x))),
        historialPrestamos: List<HistorialPrestamo>.from(
            json["historialPrestamos"]
                .map((x) => HistorialPrestamo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fechaExpiracion": fechaExpiracion,
        "multa": multa,
        "librosPrestados":
            List<dynamic>.from(librosPrestados.map((x) => x.toJson())),
        "historialPrestamos":
            List<dynamic>.from(historialPrestamos.map((x) => x.toJson())),
      };
}

class HistorialPrestamo {
  HistorialPrestamo({
    required this.codigo,
    required this.titulo,
    required this.fecha,
  });

  final String codigo;
  final String titulo;
  final String fecha;

  factory HistorialPrestamo.fromJson(Map<String, dynamic> json) =>
      HistorialPrestamo(
        codigo: json["codigo"],
        titulo: json["titulo"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "titulo": titulo,
        "fecha": fecha,
      };
}

class LibrosPrestado {
  LibrosPrestado({
    required this.index,
    required this.codigo,
    required this.titulo,
    required this.fecha,
    required this.multa,
  });

  final int index;
  final String codigo;
  final String titulo;
  final String fecha;
  final String multa;

  factory LibrosPrestado.fromJson(Map<String, dynamic> json) => LibrosPrestado(
        index: json["index"],
        codigo: json["codigo"],
        titulo: json["titulo"],
        fecha: json["fecha"],
        multa: json["multa"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "codigo": codigo,
        "titulo": titulo,
        "fecha": fecha,
        "multa": multa,
      };
}
