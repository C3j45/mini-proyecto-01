import 'package:flutter/material.dart';
import 'package:proyect1/src/datos_recibidos.dart';

class CalculadoraIMCWidget extends StatefulWidget {
  @override
  _CalculadoraIMCWidgetState createState() => _CalculadoraIMCWidgetState();
}

class _CalculadoraIMCWidgetState extends State<CalculadoraIMCWidget> {
  final ctrlnom = new TextEditingController();
  double _altura = 0.0;
  double _peso = 0.0;
  double _imc = 0.0;
  String _resultado = '';
  String _imagenResultado = '';
  final data = new Data(imc: 0.0, resultado: '');

  void calcularIMC() {
    if (_altura <= 0 || _peso <= 0) {
      setState(() {
        _imc = 0.0;
        _resultado = 'Ingresa valores válidos';
        _imagenResultado = '';
      });
      return;
    }
    setState(() {
      data.imc = _peso / (_altura * _altura);
      _imc = _peso / (_altura * _altura);
      _resultado = obtenerResultadoIMC(_imc);
      _imagenResultado = obtenerImagenResultado(_resultado);
      data.resultado = obtenerResultadoIMC(_imc);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DatosPage(data: data)));
    });
  }

  String obtenerResultadoIMC(double imc) {
    if (imc < 18.0) {
      return 'Peso Bajo';
    } else if (imc >= 18 && imc < 24.9) {
      return 'Normal';
    } else if (imc >= 25.0 && imc < 26.9) {
      return 'Obesidad';
    } else if (imc >= 27.0 && imc < 29.9) {
      return 'Obesidad (Grado 1)';
    } else if (imc >= 30.0 && imc < 34.9) {
      return 'Obesidad (Grado 2)';
    } else if (imc >= 35.0 && imc < 39.9) {
      return 'Obesidad (Grado 3)';
    } else {
      return 'Riesgo';
    }
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
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ingresa tu altura (m):'),
            SizedBox(height: 10),
            TextFormField(
              controller: ctrlnom,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _altura = double.parse(value);
                });
              },
            ),
            SizedBox(height: 20),
            Text('Ingresa tu peso (kg):'),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _peso = double.parse(value);
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text('Tu IMC es: $_imc'),
            SizedBox(height: 10),
            Text('Resultado: $_resultado'),
            if (_imagenResultado.isNotEmpty)
              Image.asset(
                _imagenResultado,
                width: 150,
                height: 150,
              ),
          ],
        ),
      ),
    );
  }
}

class Data {
  double imc;
  String resultado;

  Data({required this.imc, required this.resultado});
}
