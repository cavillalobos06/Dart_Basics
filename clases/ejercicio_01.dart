class Producto{

String nombre;
int precio;
String categoria;
bool disponible = true;

Producto({required this.nombre, required this.precio, required this.categoria});

String descripcion(){
  if(disponible){
    return '$nombre($categoria): $precio - disponible';
  }
  return '$nombre($categoria): $precio - agotado';
}

bool cambiarPrecio(int nuevoPrecio){
  if(nuevoPrecio <= 0){
    print('Precio no valido para $nombre');
    return false;
  }
  precio = nuevoPrecio;
  return true;
}

void marcarAgotado(){
  disponible = false;
}

}

void main() {
  List<Producto> carta = [
    Producto(nombre: 'Ajiaco', precio: 28000, categoria: 'Platos fuertes'),
    Producto(nombre: 'Sancocho', precio: 26000, categoria: 'Platos fuertes'),
    Producto(nombre: 'Limonada', precio: 6000, categoria: 'Bebidas'),
    Producto(nombre: 'Postre del día', precio: 9000, categoria: 'Postres'),
  ];
  carta[0].cambiarPrecio(-100);
  bool cambio = carta[2].cambiarPrecio(6500);
  print('¿Se cambió el precio de la limonada? $cambio');
  carta[1].marcarAgotado();
  print('--- Carta ---');
  int disponibles = 0;
  for (var producto in carta) {
    print(producto.descripcion());
    if (producto.disponible) {
      disponibles++;
    }
  }
  print('Disponibles: $disponibles de ${carta.length}');
  print(carta[2]);
}
