import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
