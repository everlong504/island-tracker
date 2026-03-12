import 'package:flutter/material.dart';
import 'package:island_water_impulsadores/screens/home_page.dart';
import 'package:island_water_impulsadores/screens/login_screen.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
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
          child: Column(
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
                            radius: 40,
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUjlj8_FcGPmN6bobOC-Pv--Xtat7XlVL3fQ&s',
                            ),
                            backgroundColor: Colors.transparent,
                          ),

                          const SizedBox(width: 16),

                          Text(
                            'Nombre del Usuario',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),

                      Text(
                        'Tipo de Usuario',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      const SizedBox(height: 28),

                      Row(
                        children: [
                          Icon(Icons.phone_android, size: 32),
                          const SizedBox(width: 12),
                          Text(
                            'Contactos',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Text(
                        'Info de contactos',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      const SizedBox(height: 28),

                      Row(
                        children: [
                          Icon(Icons.edit_document, size: 32),
                          const SizedBox(width: 12),
                          Text(
                            'Biografia',
                            style: Theme.of(context).textTheme.headlineSmall,
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
                            backgroundColor: Color.fromARGB(255, 170, 218, 241),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
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
              onPressed: () {},
              isSelected: true,
              hoverColor: DefaultSelectionStyle.defaultColor,
            ),
          ],
        ),
      ),
    );
  }
}
