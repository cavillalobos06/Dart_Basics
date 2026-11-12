/*Ejercicio 1 · Abrir la caja
Situación: al empezar el día, el cajero debe abrir la caja con una base de dinero para dar cambio. El sistema
debe validar las reglas antes de permitirlo.*/

void main() {
  String usuario = 'Laura';
  String rol = 'mesero'; // puede ser 'admin', 'cajero' o 'mesero'
  bool cajaAbierta = true;
  int baseInicial = -5000;
  const int baseMaxima = 10000001;
  List<String> movimientos = [];

  // Escriba aquí su código

  if (rol != 'cajero' && rol != 'admin') {
    print('El rol $rol no tiene permiso para abrir la caja');
  } else if (baseInicial < 0 || baseInicial > baseMaxima) {
    print('La base inicial no es válida');
  } else {
    cajaAbierta = true;
    movimientos.add('Apertura por $usuario con base inicial $baseInicial');
    print('Caja abierta por $usuario con base inicial de $baseInicial');
  }

  String estadoCaja = cajaAbierta ? 'ABIERTA' : 'CERRADA';
  print('Estado de la caja: $estadoCaja');
  print('Movimientos: $movimientos');
}
