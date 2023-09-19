import 'package:flutter/material.dart';
import 'package:proyect1/src/home_page.dart';

class DatosPage extends StatelessWidget {
  final Data data;
  const DatosPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Datos Recibidos'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calcular IMC'),
            Text('Tu IMC es: ${data.imc}'),
            Text('Resultado: ${data.resultado}'),
            Image.asset(obtenerImagenResultado(data.resultado))
          ],
        )));
  }

  String obtenerImagenResultado(String resultado) {
    switch (resultado) {
      case 'Peso Bajo':
        return 'assets/peso_bajo.png';
      case 'Normal':
        return 'assets/normal.png';
      case 'Obesidad':
        return 'assets/obesi.png';
      case 'Obesidad (Grado 1)':
        return 'assets/obesidad.png';
      case 'Obesidad (Grado 2)':
        return 'assets/obesidad_grado_1.png';
      case 'Obesidad (Grado 3)':
        return 'assets/obesidad_grado_2.png';
      default:
        return 'assets/Unown.png';
    }
  }
}
