import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel'),
      ),
      body: Column(
        children: [
          Container(
            height: 100, // Altura del banner
            color: Color.fromARGB(255, 172, 145, 81), // Color del banner
            child: Center(
              child: Text(
                'Banner Superior Fijo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Número de habitaciones, puedes cambiar esto según tus necesidades
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Habitación ${index + 1}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelScreen()),
            );
          },
          child: Text('Mostrar Hotel'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
