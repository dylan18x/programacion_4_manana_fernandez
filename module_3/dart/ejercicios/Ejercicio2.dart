import 'dart:io';

void main (){
  print('Ingresar calificaicon del estudiante: ');
  int nota = int.parse(stdin.readLineSync()!);
  if(nota > 7){
    print('Aprobado');
  } else if (nota < 7){
    print('Desaprobado');
  } else {
    print('Ingrese nota valida');
  }
}