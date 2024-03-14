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
        title: const Text('Mi Hotel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
              title: const Text('Información del Hotel'),
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
        return const RoomCategoryPage('Habitaciones Estándar', 'assets/habitacionsencilla');
      case 'Habitaciones Deluxe':
        return const RoomCategoryPage('Habitaciones Deluxe', 'assets/habitaciondeluxe');
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(category, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16.0),
          Image.asset(
            imagePath,
            height: 200.0,
            width: 300.0,
            fit: BoxFit.cover,
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