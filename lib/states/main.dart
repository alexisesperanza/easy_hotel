import 'package:flutter/material.dart';
import 'room.dart';
import '../businesslogic/data.dart';

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
                color: Color.fromARGB(255, 150, 141, 121),
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
              title: const Text('Hoteles Económicos'),
              onTap: () => _onCategorySelected('Hoteles Económicos'),
            ),
            ListTile(
              title: const Text('Hoteles Estándar'),
              onTap: () => _onCategorySelected('Hoteles Estándar'),
            ),
            ListTile(
              title: const Text('Hoteles De Lujo'),
              onTap: () => _onCategorySelected('Hoteles De Lujo'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Sobre Nosotros'),
              onTap: () => _onCategorySelected('Sobre nosotros'),
            ),
             ListTile(
              title: const Text('Iniciar Sesion/Registrarse'),
              onTap: () => _onCategorySelected('LoginRegister'),
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
      case 'Hoteles Económicos':
        return RoomCategoryPage(
          category: 'Hoteles Económicos',
          rooms: Economico,
        );
      case 'Hoteles Estándar':
        return RoomCategoryPage(
          category: 'Hoteles Estándar',
          rooms: Estandar,
        );
      case 'Hoteles De Lujo':
        return RoomCategoryPage(
          category: 'Hoteles De Lujo',
          rooms: Lujo,
        );
      case 'Sobre Nosotros':
        return const HotelInfoPage();

      case 'LoginRegister':
        return const LoginForm();
      
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
      child: Text('Bienvenido a EasyHotel', style: TextStyle(fontSize: 24.0)),
    );
  }
}
