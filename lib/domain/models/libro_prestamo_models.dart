class LibrosPrestado {
  final int index;
  final String codigo;
  final String titulo;
  final String fecha;
  final String multa;

  LibrosPrestado({
    required this.index,
    required this.codigo,
    required this.titulo,
    required this.fecha,
    required this.multa,
  });

  LibrosPrestado copyWith({
    int? index,
    String? codigo,
    String? titulo,
    String? fecha,
    String? multa,
  }) =>
      LibrosPrestado(
        index: index ?? this.index,
        codigo: codigo ?? this.codigo,
        titulo: titulo ?? this.titulo,
        fecha: fecha ?? this.fecha,
        multa: multa ?? this.multa,
      );

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
