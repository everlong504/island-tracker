import 'package:flutter/material.dart';

class NuevoExhibidor extends StatefulWidget {
  const NuevoExhibidor({super.key});

  @override
  State<NuevoExhibidor> createState() => _NuevoExhibidorState();
}

class _NuevoExhibidorState extends State<NuevoExhibidor> {
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
                      Text(
                        'Nombre del Exhibidor',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),

                      const SizedBox(height: 8),
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
              onPressed: () {},
              isSelected: true,
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
              isSelected: false,
              hoverColor: DefaultSelectionStyle.defaultColor,
            ),
          ],
        ),
      ),
    );
  }
}
