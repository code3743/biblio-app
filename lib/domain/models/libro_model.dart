class Libro {
  final String id;
  final String nombre;
  final String autor;
  final String? isbn;
  final String detalle;
  final String ejemplares;
  final String? imagenUrl;

  Libro({
    required this.id,
    required this.nombre,
    required this.autor,
    this.isbn,
    required this.detalle,
    required this.ejemplares,
    this.imagenUrl,
  });

  Libro copyWith({
    String? id,
    String? nombre,
    String? autor,
    String? isbn,
    String? detalle,
    String? ejemplares,
    String? imagenUrl,
  }) =>
      Libro(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        autor: autor ?? this.autor,
        isbn: isbn ?? this.isbn,
        detalle: detalle ?? this.detalle,
        ejemplares: ejemplares ?? this.ejemplares,
        imagenUrl: imagenUrl ?? this.imagenUrl,
      );

  factory Libro.fromJson(Map<String, dynamic> json) => Libro(
        id: json["id"],
        nombre: json["nombre"],
        autor: json["autor"],
        isbn: json["ISBN"],
        detalle: json["detalle"],
        ejemplares: json["ejemplares"],
        imagenUrl: json["imagenUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "autor": autor,
        "ISBN": isbn,
        "detalle": detalle,
        "ejemplares": ejemplares,
        "imagenUrl": imagenUrl,
      };
}
