import 'dart:io';

void main(){
  var sillas = 0;
  var horas = 0.0;
  var empleado = 1;
  var sillasHora = 0.0;
  var totalSillas = 0;

  while(true){
    print("---------------------------------------");
    print("Empleado Nro $empleado");
    print("Ingrese horas trabajadas: ");
    horas = double.parse(stdin.readLineSync()!);
    if(horas == 0){
      break;
    }
    print("Ingrese las sillas fabricadas: ");
    sillas = int.parse(stdin.readLineSync()!);
    sillasHora = (horas/sillas);
    if(sillasHora < 2){
      print("Produccion baja");
    } else if(sillasHora >=2 && sillasHora < 4){
      print("Produccion normal");
    } else if(sillasHora>=4){
      print("Produccion alta");
    } 

    empleado ++;
    totalSillas += sillas;
  }
  print("Total de sillas fabricadas: $totalSillas");
  print("Cantidad de empleados registrados: ${empleado-1}");
  print("Promedio de sillas por empleado: ${totalSillas/empleado}");
}