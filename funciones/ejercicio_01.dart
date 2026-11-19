int calcularPropina(int subtotal, {int porcentaje = 10}) {
  return (subtotal * porcentaje) ~/ 100;
}

String formatearPesos(int valor) {
  String texto = valor.toString();
  String resultado = '';
  int contador = 0;

  for (int i = texto.length - 1; i >= 0; i--) {
    resultado = texto[i] + resultado;
    contador++;
    if (contador == 3 && i != 0) {
      resultado = '.' + resultado;
      contador = 0;
    }
  }
  return '\$ $resultado';
}

int calcularTotal(int subtotal, {bool conPropina = true}) {
  if (conPropina) {
    return subtotal + calcularPropina(subtotal);
  }
  return subtotal;
}

void main() {
  int subtotal = 91000;
  print('Subtotal: ${formatearPesos(subtotal)}');
  print('Propina 10 %: ${formatearPesos(calcularPropina(subtotal))}');
  print(
    'Propina 15 %: ${formatearPesos(calcularPropina(subtotal, porcentaje: 15))}',
  );
  print('Total con propina: ${formatearPesos(calcularTotal(subtotal))}');
  print(
    'Total sin propina: ${formatearPesos(calcularTotal(subtotal, conPropina: false))}',
  );
  print(formatearPesos(999));
  print(formatearPesos(1000000));
}
