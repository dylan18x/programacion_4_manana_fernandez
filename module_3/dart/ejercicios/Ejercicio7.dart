import 'dart:io';

void main(){
  var pacientes = 0;
  var horas = 0.0;
  var doctor = 1;
  var pacientesHora = 0.0;
  var totalPacientes = 0;

  while(true){
    print("Doctor Nro $doctor");
    print("Ingrese horas trabajadas: ");
    horas = double.parse(stdin.readLineSync()!);
    if(horas == 0){
      break;
    }
    print("Ingrese los pacientes atendidos: ");
    pacientes = int.parse(stdin.readLineSync()!);
    pacientesHora = (pacientes/horas);
    if(pacientesHora < 3){
      print("Atención lenta");
    } else if(pacientesHora < 6){
      print("Atención normal");
    } else {
      print("Atención rápida");
    } 
    

    doctor ++;
    totalPacientes += pacientes;
  }
  print("Total de pacientes atendidos: $totalPacientes");
  print("Cantidad de horas registradas: ${horas}");
  print("Promedio de pacientes por doctor: ${totalPacientes/doctor}");
}