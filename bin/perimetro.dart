import 'dart:io';
import 'dart:math';

void perimetro() {
  print('Calculadora de distancia / perímetro (Euclidiana)');
  print('Elige una opción:');
  print('1) Distancia de un punto al origen (0,0)');
  print('2) Distancia entre dos puntos');
  print('3) Perímetro de un polígono con n vértices');
  stdout.write('Opción (1/2/3): ');
  String? opt = stdin.readLineSync();

  if (opt == '1') {
    // Distancia de un punto al origen
    // Fórmula: d = sqrt(x^2 + y^2)
    stdout.write('Ingresa x: ');
    double x = double.parse(stdin.readLineSync()!.trim());
    stdout.write('Ingresa y: ');
    double y = double.parse(stdin.readLineSync()!.trim());

    double x2 = x * x; // x^2
    double y2 = y * y; // y^2
    double suma = x2 + y2;
    double d = sqrt(suma);

    print('\nResultado:');
    print('Punto: ($x, $y)');
    print('x^2 = $x2, y^2 = $y2');
    print('x^2 + y^2 = $suma');
    print('Distancia al origen = sqrt($suma) = $d');
  } else if (opt == '2') {

    // Distancia entre dos puntos
    // Fórmula: d = sqrt((x2-x1)^2 + (y2-y1)^2)
    stdout.write('Ingresa x1: ');
    double x1 = double.parse(stdin.readLineSync()!.trim());
    stdout.write('Ingresa y1: ');
    double y1 = double.parse(stdin.readLineSync()!.trim());
    stdout.write('Ingresa x2: ');
    double x2 = double.parse(stdin.readLineSync()!.trim());
    stdout.write('Ingresa y2: ');
    double y2 = double.parse(stdin.readLineSync()!.trim());

    double dx = x2 - x1;
    double dy = y2 - y1;
    double dx2 = dx * dx;
    double dy2 = dy * dy;
    double suma = dx2 + dy2;
    double d = sqrt(suma);

    print('\nResultado:');
    print('Punto 1: ($x1, $y1)');
    print('Punto 2: ($x2, $y2)');
    print('dx = $dx, dy = $dy');
    print('dx^2 = $dx2, dy^2 = $dy2');
    print('dx^2 + dy^2 = $suma');
    print('Distancia entre puntos = sqrt($suma) = $d');
  } else if (opt == '3') {
    
    // Perímetro de un polígono con n vértices
    // Pedimos n puntos (x,y). Sumamos distancias entre vértice i y i+1, 
    // cerrando agregando el segmento del último al primero.
    stdout.write('¿Cuántos vértices tiene el polígono? (n >= 3): ');
    int n = int.parse(stdin.readLineSync()!.trim());
    if (n < 3) {
      print('Un polígono necesita al menos 3 vértices.');
      return;
    }

    // Guardamos las coordenadas en dos listas paralelas simples
    List<double> xs = [];
    List<double> ys = [];

    for (int i = 0; i < n; i++) {
      stdout.write('x${i + 1}: ');
      double xi = double.parse(stdin.readLineSync()!.trim());
      stdout.write('y${i + 1}: ');
      double yi = double.parse(stdin.readLineSync()!.trim());
      xs.add(xi);
      ys.add(yi);
    }

    double perimetro = 0.0;
    // Recorremos vértices y sumamos distancias entre consecutivos
    for (int i = 0; i < n; i++) {
      int j = (i + 1) % n; // vecino siguiente; con %n cerramos el polígono
      double dx = xs[j] - xs[i];
      double dy = ys[j] - ys[i];
      double dx2 = dx * dx;
      double dy2 = dy * dy;
      double dist = sqrt(dx2 + dy2);
      perimetro += dist;

      print('\nLado ${i + 1}:');
      print('Desde (${xs[i]}, ${ys[i]}) hasta (${xs[j]}, ${ys[j]})');
      print('dx = $dx, dy = $dy -> distancia = sqrt($dx2 + $dy2) = $dist');
    }

    print('\nPerímetro total = $perimetro');
  } else {
    print('Opción no válida. Ejecuta de nuevo y elige 1, 2 o 3.');
  }
}