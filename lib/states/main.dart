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


//CLASE HOTELHOMEPAGECONTENT MUESTRA EL CONTENIDO DE LA PANTALLA PRINCIPAL
class HotelHomePageContent extends StatelessWidget {
  const HotelHomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sección de promociones destacadas
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promociones Destacadas',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
               
                PromotionCard(
                  title: 'Oferta Especial',
                  description: '¡Reserva 3 noches y obtén un 20% de descuento!',
                  imageUrl: 'assets/prueba.png',
                ),
                SizedBox(height: 10.0),
                PromotionCard(
                  title: 'Descuento de Fin de Semana',
                  description: '¡Aprovecha nuestro descuento del 15% para estancias de fin de semana!',
                  imageUrl: 'assets/prueba.png',
                ),
              ],
            ),
          ),
          // Sección de hoteles destacados
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoteles Destacados',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                
                HotelCard(
                  name: 'PennySaver Lodge',
                  imageUrl: 'assets/prueba.png',
                ),
                SizedBox(height: 10.0),
                HotelCard(
                  name: 'Majestic Inn',
                  imageUrl: 'assets/prueba.png',
                ),
              ],
            ),
          ),
          // Sección de servicios adicionales
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Servicios Adicionales',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
               
                ServiceCard(
                  name: 'Desayuno Buffet',
                  description: 'Disfruta de nuestro delicioso desayuno buffet todas las mañanas.',
                  icon: Icons.free_breakfast,
                ),
                SizedBox(height: 10.0),
                ServiceCard(
                  name: 'Piscina',
                  description: 'Relájate en nuestra amplia piscina al aire libre.',
                  icon: Icons.pool,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const PromotionCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const HotelCard({
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;

  const ServiceCard({
    required this.name,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          name,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}

