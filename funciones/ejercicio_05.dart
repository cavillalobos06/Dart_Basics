Map<String, int> totalesPorMedio(List<int> totales, List<String> medios) {
  Map<String, int> resumen = {'efectivo': 0, 'debito': 0, 'credito': 0};

  for (int i = 0; i < totales.length; i++) {
    String medio = medios[i];
    int monto = totales[i];
    resumen[medio] = (resumen[medio] ?? 0) + monto;
  }

  return resumen;
}

int sumarLista(List<int> valores) {
  int suma = 0;
  for (int valor in valores) {
    suma += valor;
  }
  return suma;
}

int calcularEfectivoEsperado({
  required int base,
  required int ventasEfectivo,
  required int egresos,
}) {
  return base + ventasEfectivo - egresos;
}

String resultadoArqueo(int esperado, int contado) {
  if (contado == esperado) {
    return 'Caja cuadrada';
  } else if (contado > esperado) {
    return 'Sobrante de ${contado - esperado}';
  } else {
    return 'Faltante de ${esperado - contado}';
  }
}


void main() {
  int base = 200000;
  List<int> totales = [45000, 120000, 38000, 76000, 54000, 91000];
  List<String> medios = [
    'efectivo',
    'debito',
    'efectivo',
    'credito',
    'efectivo',
    'debito',
  ];
  List<int> egresos = [15000, 20000];
  Map<String, int> porMedio = totalesPorMedio(totales, medios);
  int esperado = calcularEfectivoEsperado(
    base: base,
    ventasEfectivo: porMedio['efectivo']!,
    egresos: sumarLista(egresos),
  );
  print('Ventas por medio: $porMedio');
  print('Total vendido: ${sumarLista(totales)}');
  print('Efectivo esperado: $esperado');
  print(resultadoArqueo(esperado, 300000));
  print(resultadoArqueo(esperado, 302000));
  print(resultadoArqueo(esperado, 305000));
}
