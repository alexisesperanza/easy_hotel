import 'package:flutter/material.dart';
import '../businesslogic/data.dart';

class RoomCategoryPage extends StatelessWidget {
  final String category;
  final List<Room> rooms;

  const RoomCategoryPage({
    required this.category,
    required this.rooms,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return RoomCard(room: rooms[index]);
        },
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/prueba.png',
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(room.description),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Reservado Lógica para reservar la habitación
                  },
                  child: Text('Reservar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Usuario',
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Autenticacion de usuario
              final String username = _usernameController.text;
              final String password = _passwordController.text;
              print('Usuario: $username');
              print('Contraseña: $password');
              // Logica/ validacion de usuarrio
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelInfoPage(),
                ),
              );
            },
            child: Text('Iniciar Sesión'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}


class HotelInfoPage extends StatelessWidget {
  const HotelInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Información del Hotel', style: TextStyle(fontSize: 24.0)),
    );
  }
}
