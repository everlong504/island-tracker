import 'package:flutter/material.dart';
import 'package:island_water_impulsadores/screens/nuevo_impulsador_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
              Image(image: AssetImage('assets/transparentlogo.png')),
              const SizedBox(height: 64),
              TextFormField(
                autocorrect: true,
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Buscar impulsadores',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 64),
=======
=======
>>>>>>> Stashed changes
              const SizedBox(height: 64),
              Image(
                image: AssetImage('assets/transparentlogo.png'),
                height: 120,
              ),
              const SizedBox(height: 64),
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar Impulsadores',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
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
                    backgroundColor: const Color.fromARGB(255, 238, 243, 248),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Text(
                    'Nuevo Impulsador',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
            ],
          ),
        ),
      ),
    );
  }
}
