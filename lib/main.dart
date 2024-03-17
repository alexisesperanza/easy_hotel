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
        title: const Text('EasyHotel App'),
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
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Text(
          '¡Bienvenido a EasyHotel App!',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
        _buildPromotionCard(
          context,
          '¡Obten este descuento impredible!',
          '¡Reserva 2 noches y obtén un 15% de descuento!',
          'assets/hotel1.jpg',
        ),
        SizedBox(height: 16.0),
        _buildPromotionCard(
          context,
          '¡El desayuno va por nuestra cuenta!',
          '¡Disfruta de un fin de semana con desayuno gratis!',
          'assets/hotel2.jpg',
        ),
        SizedBox(height: 16.0),
        _buildPromotionCard(
          context,
          '¡Ven con toda tu familia, te esperamos!',
          '¡Promoción especial para familias!',
          'assets/hotel3.jpg',
        ),
      ],
    );
  }

  Widget _buildPromotionCard(
      BuildContext context, String title, String subtitle, String imagePath) {
    return GestureDetector(
      onTap: () {
        //agregar accion despues de tap
        print('Clickeaste en $title');
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: () {

                print('Reservaste $title');
              },
              child: Text(
                'Reserva Ya',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
