/*Ejercicio 5 · Jornada completa y cierre de caja
Situación: terminó el día. La caja se abrió con 200.000 pesos, se hicieron 6 ventas con distintos medios de
pago y se pagaron dos gastos en efectivo. El cajero contó el efectivo y hay que hacer el arqueo. Recuerden
que las ventas con débito y a crédito no entran como efectivo a la caja.*/
void main() {
 int baseInicial = 200000;
 // Las dos listas van en el mismo orden: la venta i se pagó con el medio i
 List<int> totales = [45000, 120000, 38000, 76000, 54000, 91000];
 List<String> medios = ['efectivo', 'debito', 'efectivo', 'credito', 'efectivo', 'debito'];
 Map<String, int> egresos = {'Compra de hielo': 15000, 'Recarga de gas': 20000};
 int efectivoContado = 305000;
 // Escriba aquí su código
  totales.add(50000);
  medios.add('efectivo');

  Map<String, int> porMedio = {
    'efectivo': 0,
    'debito': 0,
    'credito': 0,
  };

  int totalVendido = 0;
  int cantidadVentas = totales.length;
  int ventaMayor = 0;

  for (int i = 0; i < totales.length; i++) {
    int valor = totales[i];
    String medio = medios[i];

    porMedio[medio] = (porMedio[medio] ?? 0) + valor;

    totalVendido += valor;
    if (valor > ventaMayor) {
      ventaMayor = valor;
    }
  }

  double promedio = cantidadVentas > 0 ? totalVendido / cantidadVentas : 0;

  int totalEgresos = 0;
  for (int valorEgreso in egresos.values) {
    totalEgresos += valorEgreso;
  }

  int efectivoEsperado = baseInicial + porMedio['efectivo']! - totalEgresos;

  print('Ventas en efectivo: ${porMedio['efectivo']} · débito: ${porMedio['debito']} · crédito: ${porMedio['credito']}');
  print('Total vendido: $totalVendido ($cantidadVentas ventas) · Venta mayor: $ventaMayor · Promedio: ${promedio.toStringAsFixed(0)}');
  print('Egresos: $totalEgresos');
  print('Efectivo esperado: $efectivoEsperado · Efectivo contado: $efectivoContado');

  if (efectivoContado == efectivoEsperado) {
    print('Caja cuadrada');
  } else if (efectivoContado > efectivoEsperado) {
    int sobrante = efectivoContado - efectivoEsperado;
    print('Sobrante de $sobrante');
  } else {
    int faltante = efectivoEsperado - efectivoContado;
    print('Faltante de $faltante');
  }
}
