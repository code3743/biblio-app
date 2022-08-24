String capitalizarNombre(String nombre) {
  List<String> nombreSeparado = nombre.toLowerCase().split(' ');
  String nombreCapitalizado = '';

  for (int i = 0; i < nombreSeparado.length; i++) {
    nombreCapitalizado += nombreSeparado[i][0].toUpperCase();

    for (int j = 1; j < nombreSeparado[i].length; j++) {
      nombreCapitalizado += nombreSeparado[i][j];
    }
    if (i < nombreSeparado.length - 1) nombreCapitalizado += ' ';
  }

  return nombreCapitalizado;
}
