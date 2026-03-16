import 'package:flutter/material.dart';
import 'package:island_water_impulsadores/screens/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

final storage = FlutterSecureStorage();

class _PerfilScreenState extends State<PerfilScreen> {
  String nombre = '';
  String correo = '';
  String permisos = '';
  String ultimoLogin = '';
  String? t = '';
  bool a = true;
  bool _isLoading = false;

  Future<bool> _getMe() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String? token = await storage.read(key: 'jwt_token');
      t = token;

      final url = Uri.parse('http://127.0.0.1:3000/api/me');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Token: $token');
        print('Status: ${response.statusCode}');
        print('Body: ${response.body}');
        setState(() {
          nombre = responseData['nombre'];
          correo = responseData['email'];
          permisos = responseData['permisos'];
          ultimoLogin = responseData['last_login'];
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getMe();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: _isLoading
              ? Text('Cargandose...')
              : Column(
                  children: [
                    const SizedBox(height: 64),

                    Image(image: AssetImage('assets/transparentlogo.png')),

                    const SizedBox(height: 28),

                    Card(
                      borderOnForeground: true,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2Yjp29QCvX2NrpJgw9P-9-75pSrHzeGhMSA&s',
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),

                                const SizedBox(width: 16),

                                Text(
                                  nombre,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                              ],
                            ),

                            Text(
                              permisos,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

                            const SizedBox(height: 28),

                            Row(
                              children: [
                                Icon(Icons.phone_android, size: 32),
                                const SizedBox(width: 12),
                                Text(
                                  correo,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // FutureBuilder<String?>(
                            //   future: getToken(),
                            //   builder: (context, snapshot) {
                            //     if (snapshot.connectionState ==
                            //         ConnectionState.waiting) {
                            //       return const CircularProgressIndicator();
                            //     } else if (snapshot.hasError) {
                            //       return Text('Error: ${snapshot.error}');
                            //     } else {
                            //       return Text(snapshot.data ?? 'No token');
                            //     }
                            //   },
                            // ),
                            const SizedBox(height: 28),

                            Row(
                              children: [
                                Icon(Icons.edit_document, size: 32),
                                const SizedBox(width: 12),
                                Text(
                                  'Biografia',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            Text(
                              'Biografia del usuario',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

                            const SizedBox(height: 45),

                            SizedBox(
                              width: double.infinity,
                              height: 65,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    170,
                                    218,
                                    241,
                                  ),
                                ),
                                child: const Text(
                                  'Editar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 21, 70, 77),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            SizedBox(
                              width: double.infinity,
                              height: 65,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                ),
                                child: const Text(
                                  'Salir de Sesion',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              isSelected: false,
              hoverColor: DefaultSelectionStyle.defaultColor,
            ),

            IconButton(
              tooltip: 'Profile',
              icon: const Icon(Icons.person),
              onPressed: () {
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilScreen()),
                );
                */
              },
              isSelected: true,
              hoverColor: DefaultSelectionStyle.defaultColor,
            ),
          ],
        ),
      ),
    );
  }
}
