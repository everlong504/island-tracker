import 'package:flutter/material.dart';

class NuevoImpulsador extends StatefulWidget {
  const NuevoImpulsador({super.key});

  @override
  State<NuevoImpulsador> createState() => _NuevoImpulsadorState();
}

class _NuevoImpulsadorState extends State<NuevoImpulsador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Impulsador')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Contenido de la pantalla de nuevo impulsador'),
      ),
    );
  }
}
