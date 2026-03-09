import 'package:flutter/material.dart';

import 'package:island_water_impulsadores/screens/nuevo_impulsador_screen.dart';
import 'package:island_water_impulsadores/screens/perfil_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _impulsadorController = TextEditingController();

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

              TextFormField(
                controller: _impulsadorController,
                decoration: const InputDecoration(
                  hintText: 'Nombre del impulsador',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 128),

              SizedBox(
                width: double.infinity,
                height: 100,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NuevoImpulsador(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  child: const Text(
                    'Nuevo Impulsador',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              onPressed: () {},
              isSelected: true,
              hoverColor: DefaultSelectionStyle.defaultColor,
            ),

            IconButton(
              tooltip: 'Profile',
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilScreen()),
                );
              },
              isSelected: false,
              hoverColor: DefaultSelectionStyle.defaultColor,
            ),
          ],
        ),
      ),
    );
  }
}
