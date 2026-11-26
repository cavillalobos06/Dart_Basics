class Producto {
  final String nombre;
  final double precio;

  Producto(this.nombre, this.precio);
}

class ItemPedido {
  Producto producto;
  int cantidad;
  String? observacion;

  ItemPedido(this.producto, this.cantidad, {this.observacion});

  double get subtotal => producto.precio * cantidad;
}

class Pedido {
  int mesa;
  String mesero;
  List<ItemPedido> items = [];

  Pedido(this.mesa, this.mesero);

  void agregarProducto(Producto producto, int cantidad, {String? observacion}) {
    for (var item in items) {
      if (item.producto.nombre == producto.nombre) {
        item.cantidad += cantidad;
        if (observacion != null) {
          item.observacion = observacion;
        }
        return;
      }
    }
    items.add(ItemPedido(producto, cantidad, observacion: observacion));
  }

  bool quitarProducto(String nombre, int cantidad) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].producto.nombre == nombre) {
        items[i].cantidad -= cantidad;

        if (items[i].cantidad <= 0) {
          items.removeAt(i);
        }
        return true;
      }
    }
    print('$nombre no está en el pedido');
    return false;
  }

  double get total {
    double suma = 0;
    for (var item in items) {
      suma += item.subtotal;
    }
    return suma;
  }

  int get cantidadArticulos {
    int totalItems = 0;
    for (var item in items) {
      totalItems += item.cantidad;
    }
    return totalItems;
  }

  void imprimirComanda() {
    print('Mesa $mesa - Mesero: $mesero');
    for (var item in items) {
      String obs = item.observacion != null ? ' (${item.observacion})' : '';
      print(
        '${item.cantidad}x ${item.producto.nombre}$obs - \$${item.subtotal.toStringAsFixed(0)}',
      );
    }
    print('Total: ${total.toStringAsFixed(0)} ($cantidadArticulos artículos)');
  }
}

void main() {
  var bandeja = Producto('Bandeja paisa', 32000);
  var limonada = Producto('Limonada', 6000);
  var postre = Producto('Postre del día', 9000);
  var pedido = Pedido(4, 'Carlos');
  pedido.agregarProducto(bandeja, 2, observacion: 'Una sin chicharrón');
  pedido.agregarProducto(limonada, 2);
  pedido.agregarProducto(postre, 1);
  pedido.agregarProducto(limonada, 1);
  pedido.quitarProducto('Postre del día', 1);
  pedido.quitarProducto('Ajiaco', 1);
  pedido.imprimirComanda();
}
