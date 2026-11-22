Map<String, int> menuDelDia = {
  'Bandeja paisa': 32000,
  'Ajiaco': 28000,
  'Limonada': 6000,
  'Gaseosa': 5000,
  'Postre del día': 9000,
};

int calcularSubtotalPedido(Map<String, int> menu, Map<String, int> pedido) {
  int subtotal = 0;

  pedido.forEach((producto, cantidad) {
    if (menu.containsKey(producto)) {
      subtotal += menu[producto]! * cantidad;
    }
  });

  return subtotal;
}

List<String> productosNoEncontrados(
  Map<String, int> menu,
  Map<String, int> pedido,
) {
  List<String> noEncontrados = [];

  pedido.forEach((producto, cantidad) {
    if (!menu.containsKey(producto)) {
      noEncontrados.add(producto);
    }
  });

  return noEncontrados;
}

void imprimirComanda(int mesa, Map<String, int> menu, Map<String, int> pedido) {
  print('--- COMANDA MESA $mesa ---');

  pedido.forEach((producto, cantidad) {
    if (menu.containsKey(producto)) {
      int totalLinea = menu[producto]! * cantidad;
      print('$cantidad x $producto = $totalLinea');
    }
  });

  List<String> faltantes = productosNoEncontrados(menu, pedido);
  if (faltantes.isNotEmpty) {
    print('No están en el menú: $faltantes');
  }

  int subtotal = calcularSubtotalPedido(menu, pedido);
  print('Subtotal: $subtotal');
}

void main() {
  Map<String, int> pedidoMesa4 = {
    'Bandeja paisa': 2,
    'Limonada': 3,
    'Postre del día': 1,
    'Cazuela': 1,
  };
  imprimirComanda(4, menuDelDia, pedidoMesa4);
  Map<String, int> pedidoMesa9 = {'Ajiaco': 2, 'Gaseosa': 2};
  imprimirComanda(9, menuDelDia, pedidoMesa9);
}
