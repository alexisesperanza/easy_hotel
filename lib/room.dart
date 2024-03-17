import 'package:flutter/material.dart';
import 'data.dart';

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
            room.imageUrl,
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
                    // Lógica para reservar la habitación
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

class HotelInfoPage extends StatelessWidget {
  const HotelInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Información del Hotel', style: TextStyle(fontSize: 24.0)),
    );
  }
}
