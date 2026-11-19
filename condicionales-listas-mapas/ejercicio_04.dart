/*Ejercicio 4 · Devolución de un producto
Situación: en la mesa 7 un cliente devuelve una gaseosa porque estaba en mal estado. Hay que descontarla
de la venta. Las devoluciones de más de 30.000 pesos requieren autorización del administrador.*/
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
 Map<String, int> venta = {'Sancocho': 2, 'Gaseosa': 3, 'Postre del día': 2};
 String productoDevuelto = 'Sancocho';
 int cantidadDevuelta = 2;
 String motivo = 'Producto en mal estado';
 bool autorizadoPorAdmin = true;
 const int limiteSinAutorizacion = 30000;
 List<String> devoluciones = [];
 // Escriba aquí su código

 int totalOriginal = 0;
  for (var entry in venta.entries) {
    totalOriginal += menu[entry.key]! * entry.value;
  }
  print('Total original: $totalOriginal');

  if (!venta.containsKey(productoDevuelto)) {
    print('Error: el producto $productoDevuelto no hace parte de la venta');
  } else if (cantidadDevuelta <= 0 || cantidadDevuelta > venta[productoDevuelto]!) {
    print('Error: la cantidad a devolver no es válida');
  } else {
    int valorDevolucion = menu[productoDevuelto]! * cantidadDevuelta;

    if (valorDevolucion > limiteSinAutorizacion && !autorizadoPorAdmin) {
      print('Error: la devolución de $valorDevolucion supera el límite y requiere autorización');
    } else {
      int nuevaCantidad = venta[productoDevuelto]! - cantidadDevuelta;
      if (nuevaCantidad == 0) {
        venta.remove(productoDevuelto);
      } else {
        venta[productoDevuelto] = nuevaCantidad;
      }

      devoluciones.add('$cantidadDevuelta x $productoDevuelto ($motivo): $valorDevolucion');
      print('Devolución registrada: $valorDevolucion');
    }
  }

  int nuevoTotal = 0;
  for (var entry in venta.entries) {
    nuevoTotal += menu[entry.key]! * entry.value;
  }

  print('Venta actualizada: $venta');
  print('Nuevo total: $nuevoTotal');
  print('Devoluciones: $devoluciones');
}
