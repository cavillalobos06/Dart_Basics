int calcularPorcentajeDescuento({required int subtotal, String? cupon, bool clienteFrecuente = false, int maximo = 20}){
    int porcentaje = 0;

    if (subtotal >= 150000) {
    porcentaje += 10;
    }

    if (cupon != null && cupon.trim().isNotEmpty) {
        
    String cuponNormalizado = cupon.trim().toUpperCase();

    if (cuponNormalizado == 'CUMPLE') {
      porcentaje += 15;
    }else if (cuponNormalizado == 'ESTUDIANTE') {
      porcentaje += 5;
    }else {
      print('Cupón $cupon no válido');
    }

    if (clienteFrecuente) {
    porcentaje += 5;
    }

    if (porcentaje > maximo) {
    porcentaje = maximo;
    }

    }
    
    return porcentaje;
}

int aplicarDescuento(int subtotal, int porcentaje) {
  double descuento = subtotal * (porcentaje / 100);
  return (subtotal - descuento).round();
}

void main() {
List<int> subtotales = [162000, 162000, 80000, 80000];
List<String?> cupones = ['CUMPLE', null, 'estudiante', 'GRATIS'];
List<bool> frecuentes = [true, true, false, false];
for (var i = 0; i < subtotales.length; i++) {
int porcentaje = calcularPorcentajeDescuento(
subtotal: subtotales[i],
cupon: cupones[i],
clienteFrecuente: frecuentes[i],
);
int total = aplicarDescuento(subtotales[i], porcentaje);
print('Caso ${i + 1}: subtotal ${subtotales[i]}, descuento $porcentaje %, total $total');
}
}
