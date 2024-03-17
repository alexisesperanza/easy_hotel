import 'package:flutter/material.dart';

void main() {
  runApp(const MyHotelApp());
}

class MyHotelApp extends StatelessWidget {
  const MyHotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HotelHomePage(),
    );
  }
}

class HotelHomePage extends StatefulWidget {
  const HotelHomePage({super.key});

  @override
  _HotelHomePageState createState() => _HotelHomePageState();
}

class _HotelHomePageState extends State<HotelHomePage> {
  String _selectedCategory = 'Inicio';

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
    Navigator.pop(context); // Cerrar el menú desplegable lateral
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyHotel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 185, 22),
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () => _onCategorySelected('Inicio'),
            ),
            ListTile(
              title: const Text('Habitaciones Estándar'),
              onTap: () => _onCategorySelected('Habitaciones Estándar'),
            ),
            ListTile(
              title: const Text('Habitaciones Deluxe'),
              onTap: () => _onCategorySelected('Habitaciones Deluxe'),
            ),
            ListTile(
              title: const Text('Suite Presidencial'),
              onTap: () => _onCategorySelected('Suite Presidencial'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Sobre nosotros'),
              onTap: () => _onCategorySelected('Información del Hotel'),
            ),
          ],
        ),
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    switch (_selectedCategory) {
      case 'Inicio':
        return const HotelHomePageContent();
      case 'Habitaciones Estándar':
        return const RoomCategoryPage(
            'Habitaciones Estándar', 'assets/imagenes/habitacionsencilla.jpg');
      case 'Habitaciones Deluxe':
        return const RoomCategoryPage('Habitaciones Deluxe', 'assets/habitaciondeluxe.jpg ');
      case 'Suite Presidencial':
        return const RoomCategoryPage('Suite Presidencial', 'assets/suitepresidencial');
      case 'Información del Hotel':
        return const HotelInfoPage();
      default:
        return const HotelHomePageContent();
    }
  }
}

class HotelHomePageContent extends StatelessWidget {
  const HotelHomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bienvenido al Hotel', style: TextStyle(fontSize: 24.0)),
    );
  }
}

class RoomCategoryPage extends StatelessWidget {
  final String category;
  final String imagePath;

  const RoomCategoryPage(this.category, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        5, // Número de habitaciones
        (index) => RoomCard(
          imageUrl: imagePath,
          description: 'Descripción de la habitación $index',
          onPressed: () {
            // Lógica para reservar la habitación
            // Puedes añadir aquí la lógica de navegación para ir a la pantalla de reserva
          },
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final VoidCallback onPressed;

  const RoomCard({super.key, 
    required this.imageUrl,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imageUrl,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Reservar'),
          ),
        ],
      ),
    );
  }
}

class HotelInfoPage extends StatelessWidget {
  const HotelInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Información del Hotel', style: TextStyle(fontSize: 24.0)),
    );
  }
}
