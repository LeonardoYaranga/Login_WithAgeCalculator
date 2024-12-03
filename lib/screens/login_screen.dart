import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './welcome_screen.dart';
import '../logic/logic_login.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  PantallaLoginState createState() => PantallaLoginState();
}

class PantallaLoginState extends State<PantallaLogin> {
  //declarar componentes
  final TextEditingController controladorUsuario = TextEditingController();
  final TextEditingController controladorContrasena = TextEditingController();

  //instanciacion de clase
  final LogicaLogin logicaLogin = LogicaLogin();

  //errores
  String mensajeError = "";

  //método
  void iniciarSesion() {
    final usuario = controladorUsuario.text;
    final contrasena = controladorContrasena.text;

    //logica y navegar
    if (logicaLogin.verificarCredenciales(usuario, contrasena)) {
      //Navegar a la pantalla de bienvenida
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PantallaBienvenida(usuario: usuario)));
    } else {
      setState(() {
        mensajeError = "Usuario o contraseña incorrectos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF080808), // Color negro con opacidad completa
          Color(0xFFA8072A), // Un rojo con opacidad completa
          Color(0xFF9967A0), // Un color púrpura/rosado
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person_3_rounded),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: controladorUsuario,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_2,
                        color: Colors.redAccent,
                      ),
                      hintText: "Usuario",
                      hintStyle: const TextStyle(color: Colors.white),  //Color de texto
                      filled: true,
                      fillColor: Colors.black.withOpacity(1.0),  //Color de fondo
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: controladorContrasena,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_2,
                        color: Colors.redAccent,
                      ),
                      hintText: "Usuario",
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black.withOpacity(1.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),

                //mensaje de error
                if (mensajeError.isNotEmpty)
                  Text(
                    mensajeError,
                    style: const TextStyle(color: Colors.redAccent),
                  ),

                //button
                ElevatedButton(
                  onPressed: iniciarSesion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.black,  
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Iniciar Sesión"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
