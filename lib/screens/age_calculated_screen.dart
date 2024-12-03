import 'package:flutter/material.dart';
import '../logic/age_calculator.dart';

class CalcularEdadPage extends StatefulWidget {
  final String nombre;
  final int anioNacimiento;
  final int mesNacimiento;
  final int diaNacimiento;

  const CalcularEdadPage({
    super.key,
    required this.nombre,
    required this.anioNacimiento,
    required this.mesNacimiento,
    required this.diaNacimiento,
  });

  @override
  State<CalcularEdadPage> createState() => _CalcularEdadPageState();
}

class _CalcularEdadPageState extends State<CalcularEdadPage> {

  AgeCalculator edad = AgeCalculator(days: 0, months: 0, years: 0);

  @override
  void initState() {
    super.initState();
    // Calcular la edad usando la clase Edad
    edad = edad.calculateAge(widget.anioNacimiento, widget.mesNacimiento, widget.diaNacimiento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nombre: ${widget.nombre}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Edad:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${edad.years} años, ${edad.months} meses, ${edad.days} días',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}