import 'package:flutter/material.dart';
import 'room.dart';
import 'data.dart';

void main() {
  runApp(MaterialApp(
    home: HotelHomePage(),
  ));
}

class HotelHomePage extends StatefulWidget {
  const HotelHomePage({Key? key}) : super(key: key);

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
              title: const Text('Suites Presidenciales'),
              onTap: () => _onCategorySelected('Suites Presidenciales'),
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
        return RoomCategoryPage(
          category: 'Habitaciones Estándar',
          rooms: standardRooms,
        );
      case 'Habitaciones Deluxe':
        return RoomCategoryPage(
          category: 'Habitaciones Deluxe',
          rooms: deluxeRooms,
        );
      case 'Suites Presidenciales':
        return RoomCategoryPage(
          category: 'Suites Presidenciales',
          rooms: presidentialSuites,
        );
      case 'Información del Hotel':
        return const HotelInfoPage();
      default:
        return const HotelHomePageContent();
    }
  }
}

class HotelHomePageContent extends StatelessWidget {
  const HotelHomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bienvenido al Hotel', style: TextStyle(fontSize: 24.0)),
    );
  }
}
