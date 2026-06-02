int duplicarEjemplares(int n)  => n * 2;
int triplicarEjemplares(int n) => n * 3;

void main() {
  int Function(int) operacion;

  operacion = duplicarEjemplares;
  print(operacion(5));

  operacion = triplicarEjemplares;
  print(operacion(5));

  final transformaciones = <int Function(int)>[duplicarEjemplares, triplicarEjemplares];
  for (final fn in transformaciones) {
    print(fn(10));
  }
}