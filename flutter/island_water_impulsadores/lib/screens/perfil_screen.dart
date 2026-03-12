import 'package:flutter/material.dart';
import 'package:island_water_impulsadores/screens/home_page.dart';
import 'package:island_water_impulsadores/screens/login_screen.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nombreUsuarioController = TextEditingController();
  final _contactosUsuarioController = TextEditingController();
  final _biografiaUsuarioController = TextEditingController();

  bool obscurePassword = true;

  @override
  void _dispose() {
    _biografiaUsuarioController.dispose();
    _contactosUsuarioController.dispose();
    _nombreUsuarioController.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Texto Editar')));
    }
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
          padding: const EdgeInsets.all(16.0),
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
                            radius: 35,
                            backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_640.png',
                            ),
                            backgroundColor: Colors.transparent,
                          ),

                          const SizedBox(width: 10),

                          Text(
                            'Nombre de Usuario',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),

                          IconButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 700,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,

                                        children: <Widget>[
                                          Text(
                                            'Edita el Usuario',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.headlineSmall,
                                          ),

                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller:
                                                _nombreUsuarioController,
                                            decoration: const InputDecoration(
                                              labelText: 'Nombre',
                                              hintText: 'Nombre del Usuario',
                                              alignLabelWithHint: true,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),

                                          const SizedBox(height: 16),

                                          TextFormField(
                                            controller:
                                                _contactosUsuarioController,
                                            decoration: const InputDecoration(
                                              labelText: 'Contacto',
                                              hintText: 'Contacto del Usuario',
                                              alignLabelWithHint: true,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),

                                          const SizedBox(height: 16),

                                          TextFormField(
                                            controller:
                                                _biografiaUsuarioController,
                                            maxLines: 4,
                                            decoration: const InputDecoration(
                                              labelText: 'Biografia',
                                              hintText: 'Biografia del Usuario',
                                              alignLabelWithHint: true,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),

                                          const SizedBox(height: 16),

                                          SizedBox(
                                            width: double.infinity,
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: _submitForm,
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueAccent,
                                                foregroundColor: Colors.white,
                                              ),
                                              child: const Text(
                                                'Editar',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );

                            _dispose();
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
