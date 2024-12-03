import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'insert_data_screen.dart';

class PantallaBienvenida extends StatelessWidget {
  final String usuario;

  const PantallaBienvenida({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido $usuario"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hola, $usuario", style: const TextStyle(height: 20)),
            const Text('BIenvenido a la aplicación',
            style: TextStyle(fontSize: 20)),

            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text("Cerrar sesion")
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => InsertdataScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text("Insertar datos")
            )

          ],
        ),
      ),
    );
  }

}