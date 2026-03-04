import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioController = TextEditingController();
  final _passController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Screen'),

            TextFormField(
              controller: _usuarioController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                hintText: 'Ingrese su usuario',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su usuario';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _passController,
              obscureText: _obscureText,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese su contraseña',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su contraseña';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
