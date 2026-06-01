import 'dart:io';

void main (){
  var empleados = 1;
  var total_cajas = 0;
  while(true){
    print('Empleado Nro: $empleados');
    print('Ingrese la cantidad de cajas empacadas: ');
    var cajas = int.parse(stdin.readLineSync()!);
    if(cajas < 20){
      print('Rendimiento bajo');
    } else if (cajas >= 20 && cajas < 50){
      print('Rendimiento normal');
    } else {
      print('Rendimiento excelente');
    }
    if(cajas == 0){
      break;
    }
    total_cajas += cajas;
    empleados ++;
  }
  print('Total de cajas empacadas: $total_cajas');
  print('Cantidad de empleados registrados: $empleados');
  print('Promedio de cajas por empleado: ${total_cajas/empleados}');
}