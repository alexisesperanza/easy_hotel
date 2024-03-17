class Room {
  final String imageUrl;
  final String title;
  final String description;

  Room({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

List<Room> standardRooms = [
  Room(
    imageUrl: 'assets/standard_room1.jpg',
    title: 'Habitación Estándar 1',
    description: 'Esta es una habitación estándar con una cama individual.',
  ),
  Room(
    imageUrl: 'assets/standard_room2.jpg',
    title: 'Habitación Estándar 2',
    description: 'Esta es una habitación estándar con una cama doble.',
  ),
];

List<Room> deluxeRooms = [
  Room(
    imageUrl: 'assets/deluxe_room1.jpg',
    title: 'Habitación Deluxe 1',
    description: 'Esta es una habitación deluxe con vista al mar.',
  ),
  Room(
    imageUrl: 'assets/deluxe_room2.jpg',
    title: 'Habitación Deluxe 2',
    description: 'Esta es una habitación deluxe con jacuzzi.',
  ),
];

List<Room> presidentialSuites = [
  Room(
    imageUrl: 'assets/presidential_suite1.jpg',
    title: 'Suite Presidencial 1',
    description: 'Esta es una suite presidencial con sala de estar y balcón privado.',
  ),
  Room(
    imageUrl: 'assets/presidential_suite2.jpg',
    title: 'Suite Presidencial 2',
    description: 'Esta es una suite presidencial con piscina privada y vistas panorámicas.',
  ),
];
