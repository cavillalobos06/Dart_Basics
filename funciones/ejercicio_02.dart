String? validarAperturaCaja(String rol, int base, bool cajaAbierta) {
  if (cajaAbierta) {
    return 'La caja ya está abierta';
  }
  if (rol != 'cajero' && rol != 'admin') {
    return 'El rol $rol no puede abrir la caja';
  }
  if (base < 0) {
    return 'La base no puede ser negativa';
  }
  if (base > 10000000) {
    return 'La base supera el máximo permitido';
  }
  return null;
}

String estadoCaja(bool abierta) => abierta ? 'ABIERTA' : 'CERRADA';

void main() {
  List<String> roles = ['cajero', 'mesero', 'admin', 'cajero', 'admin'];
  List<int> bases = [200000, 200000, -5000, 10000001, 100000];
  List<bool> abiertas = [false, false, false, false, true];
  for (var i = 0; i < roles.length; i++) {
    String? error = validarAperturaCaja(roles[i], bases[i], abiertas[i]);
    bool quedaAbierta = abiertas[i] || error == null;
    String resultado = error ?? 'Caja abierta con base ${bases[i]}';
    print('Caso ${i + 1}: $resultado. Estado: ${estadoCaja(quedaAbierta)}');
  }
}
