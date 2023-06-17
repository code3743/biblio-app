class HistorialPrestamo {
  final String codigo;
  final String titulo;
  final String fecha;

  HistorialPrestamo({
    required this.codigo,
    required this.titulo,
    required this.fecha,
  });

  HistorialPrestamo copyWith({
    String? codigo,
    String? titulo,
    String? fecha,
  }) =>
      HistorialPrestamo(
        codigo: codigo ?? this.codigo,
        titulo: titulo ?? this.titulo,
        fecha: fecha ?? this.fecha,
      );

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
