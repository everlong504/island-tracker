import 'package:flutter/material.dart';
import 'package:island_water_impulsadores/screens/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  String _response = 'Press a button to perform an HTTP request.';
  bool _loading = false;

  bool _isLoading = false;
  String _snackMessage = '';
  bool _usuarioformError = false;
  bool _passformError = false;

  Future<bool> _login() async {
    setState(() {
      _isLoading = true;
      _snackMessage = '';
    });

    try {
      final url = Uri.parse('http://127.0.0.1:3000/api/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _usuarioController.text,
          'password_hash': _passController.text,
        }),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['success'] == true ||
            responseData.containsKey('token')) {
          setState(() {
            var name = responseData['user']['email'];
            _snackMessage = 'Buenos dias, $name';
          });
          return true;
        } else {
          return false;
        }
      } else {
        setState(() {
          if (_usuarioformError == false && _passformError == false) {
            _snackMessage = responseData['error'];
          }
        });
        return false;
      }
    } catch (e) {
      setState(() {
        _snackMessage = 'Error de conexion: $e';
      });
      return false;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Decoracion del Fondo//
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: [
              const Color.fromARGB(255, 93, 224, 230),
              const Color.fromARGB(255, 22, 135, 207),
            ],
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(28.0),

          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/transparentlogo.png'),
                  height: 120,
                ),

                const SizedBox(height: 64),

                Row(
                  children: [
                    Text(
                      'Bienvenido',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                TextFormField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su usuario',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _usuarioformError = true;
                      });
                      return 'Por favor ingrese su usuario';
                    }
                    if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      setState(() {
                        _usuarioformError = true;
                      });
                      return 'Ingrese un correo valido';
                    }
                    setState(() {
                      _usuarioformError = false;
                    });
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _passController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su contraseña',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.trim() == '') {
                      setState(() {
                        _passformError = true;
                      });
                      return 'Por favor ingrese su contraseña';
                    }
                    setState(() {
                      _passformError = false;
                    });
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              bool success = await _login();
                              if (success && mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              }
                            }
                            if (_snackMessage.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(_snackMessage)),
                              );
                            }
                          },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                /* Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _loading
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Text(
                              _response,
                              style: const TextStyle(fontFamily: 'monospace'),
                            ),
                          ),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
