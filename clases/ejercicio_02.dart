enum estadoMesa { libre, ocupada, enCuenta }

class Mesa {
  final int numero;
  final int capacidad;
  estadoMesa estado = estadoMesa.libre;
  int comensales = 0;

  Mesa(this.numero, this.capacidad);

  bool ocupar(int personas) {
    if (estado != estadoMesa.libre) {
      print('Mesa $numero: no se puede ocupar, está ${estado.name}');
      return false;
    }
    if (personas < 1 || personas > capacidad) {
      print('Mesa $numero: $personas personas no caben (capacidad $capacidad)');
      return false;
    }
    comensales = personas;
    estado = estadoMesa.ocupada;
    print('Mesa $numero: ocupada por $comensales personas');
    return true;
  }

  bool pedirCuenta() {
    if (estado != estadoMesa.ocupada) {
      print('Mesa $numero: no se puede pedir la cuenta, está ${estado.name}');
      return false;
    }
    estado = estadoMesa.enCuenta;
    print('Mesa $numero: cuenta solicitada');
    return true;
  }

  bool liberar() {
    if (estado != estadoMesa.enCuenta) {
      print('Mesa $numero: no se puede liberar sin pedir la cuenta');
      return false;
    }
    comensales = 0;
    estado = estadoMesa.libre;
    print('Mesa $numero: liberada');
    return true;
  }

  @override
  String toString() {
    return 'Mesa $numero ($capacidad puestos): ${estado.name}, $comensales personas';
  }
}

void main() {
  Mesa mesa4 = Mesa(4, 4);
  mesa4.ocupar(6);
  mesa4.ocupar(3);
  mesa4.ocupar(2);
  mesa4.liberar();
  mesa4.pedirCuenta();
  print(mesa4);
  mesa4.liberar();
  print(mesa4);
}
