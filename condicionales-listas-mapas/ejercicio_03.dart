/*Ejercicio 3 · Venta con descuento
Situación: el restaurante tiene una política de descuentos. Un grupo celebra un cumpleaños y es cliente
frecuente. El sistema debe calcular el descuento sin superar el máximo permitido.*/
void main() {
 Map<String, int> menu = {
 'Ajiaco': 28000,
 'Bandeja paisa': 32000,
 'Sancocho': 26000,
 'Limonada': 6000,
 'Jugo natural': 7000,
 'Gaseosa': 5000,
 'Postre del día': 9000,
 };
 Map<String, int> pedido = {
 'Ajiaco': 1,
 'Jugo natural': 4,
 'Postre del día': 2,
 'Bandeja paisa': 1,
 };
 String? cupon = null; // puede ser null si no hay cupón
 bool clienteFrecuente = false;
 const int descuentoMaximo = 20; // porcentaje máximo
 // Escriba aquí su código

 int subtotal = 0;
  for (var entry in pedido.entries) {
    if (menu.containsKey(entry.key)) {
      subtotal += menu[entry.key]! * entry.value;
    }
  }
  print('Subtotal: $subtotal');

  int porcentajeDescuento = 0;
  List<String> motivos = [];

  if (subtotal >= 150000) {
    porcentajeDescuento += 10;
    motivos.add('compra mayor a 150.000 (10 %)');
  }

  if (cupon != null) {
    String cuponNormalizado = cupon.toUpperCase();
    if (cuponNormalizado == 'CUMPLE') {
      porcentajeDescuento += 15;
      motivos.add('cupón CUMPLE (15 %)');
    } else if (cuponNormalizado == 'ESTUDIANTE') {
      porcentajeDescuento += 5;
      motivos.add('cupón ESTUDIANTE (5 %)');
    } else {
      print('Cupón "$cupon" no válido');
    }
  }

  if (clienteFrecuente) {
    porcentajeDescuento += 5;
    motivos.add('cliente frecuente (5 %)');
  }

  if (porcentajeDescuento > descuentoMaximo) {
    print(
      'El descuento de $porcentajeDescuento % supera el máximo; se aplica $descuentoMaximo %',
    );
    porcentajeDescuento = descuentoMaximo;
  }

  int valorDescuento = (subtotal * porcentajeDescuento / 100).round();
  int totalPagar = subtotal - valorDescuento;

  print('Descuento: $valorDescuento · TOTAL A PAGAR: $totalPagar');
  print('Motivos: ${motivos.join(', ')}');
}
