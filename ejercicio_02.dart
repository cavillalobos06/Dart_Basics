/*Ejercicio 2 · Registrar la venta de una mesa
Situación: el mesero tomó el pedido de la mesa 4. Hay que calcular la cuenta, agregar la propina voluntaria y
registrar el pago. Uno de los productos que anotó el mesero no existe en el menú.*/

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
    'Bandeja paisa': 2,
    'Limonada': 3,
    'Postre del día': 1,
    'Cazuela': 1, // no está en el menú
  };
  bool incluirPropina = false; // propina voluntaria del 10 %
  String medioPago = 'bitcoin'; // 'efectivo' o 'debito'
  int valorRecibido = 90000; // solo para efectivo
  String? referencia; // solo para débito
  // Escriba aquí su código

  int subtotal = 0;

  for (var entry in pedido.entries) {
    String producto = entry.key;
    int cantidad = entry.value;

    if (!menu.containsKey(producto)) {
      print('Producto $producto no existe en el menú');
      continue;
    }

    int precio = menu[producto]!;
    int valorLinea = precio * cantidad;
    subtotal += valorLinea;

    print('$producto x$cantidad = $valorLinea');
  }

  int propina = (subtotal * 0.10).round();
  int total = subtotal + propina;

  print('Subtotal: $subtotal · Propina: $propina · TOTAL: $total');

  switch (medioPago) {
    case 'efectivo':
      if (valorRecibido >= total) {
        int cambio = valorRecibido - total;
        print('Cambio: $cambio');
      } else {
        int falta = total - valorRecibido;
        print('Dinero insuficiente, faltan: $falta');
      }
      break;

    case 'debito':
      if (referencia == null || referencia.isEmpty) {
        print('Error: falta la referencia del pago con débito');
      } else {
        print('Pago con débito aprobado · Referencia: $referencia');
      }
      break;

    default:
      print('Medio de pago inválido');
  }
}
