import 'package:flutter/material.dart';
import 'package:island_water_impulsadores/screens/home_page.dart';

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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/pfp.jpg'),
                          ),
                          const SizedBox(width: 16),

                          Text(
                            'Nombre del Usuario',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),
                      Text(
                        'Tipo de Usuario',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      const SizedBox(height: 32),

                      Text(
                        'Nombre del Usuario',
                        style: Theme.of(context).textTheme.headlineSmall,
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
