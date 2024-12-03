import 'package:flutter/material.dart';
import 'age_calculated_screen.dart';

class InsertdataScreen extends StatelessWidget {
  // Declarar controladores
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();

  InsertdataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Data"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _yearController,
              decoration: const InputDecoration(
                labelText: 'Año',
                icon: Icon(Icons.calendar_month),
              ),
            ),
            TextFormField(
              controller: _monthController,
              decoration: const InputDecoration(
                labelText: 'Mes',
                icon: Icon(Icons.calendar_month),
              ),
            ),
            TextFormField(
              controller: _dayController,
              decoration: const InputDecoration(
                labelText: 'Día',
                icon: Icon(Icons.calendar_today),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text.trim();
                int year = int.tryParse(_yearController.text.trim()) ?? 0;
                int month = int.tryParse(_monthController.text.trim()) ?? 0;
                int day = int.tryParse(_dayController.text.trim()) ?? 0;

                if (name.isNotEmpty &&
                    year > 0 &&
                    month > 0 &&
                    day > 0 &&
                    month <= 12 &&
                    day <= 31) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalcularEdadPage(
                        nombre: name,
                        anioNacimiento: year,
                        mesNacimiento: month,
                        diaNacimiento: day,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Por favor ingrese datos correctos"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text("Guardar Datos"),
            ),
          ],
        ),
      ),
    );
  }
}
