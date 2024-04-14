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

List<Room> Economico = [
  Room(
    imageUrl: 'assets/prueba.png',
    title: 'Habitación Estándar 1',
    description: 'Esta es una habitación estándar con una cama individual.',
  ),
  Room(
    imageUrl: 'assets/imagenes/sd2.webp',
    title: 'Habitación Estándar 2',
    description: 'Esta es una habitación estándar con una cama doble.',
  ),
];

List<Room> Estandar = [
  Room(
    imageUrl: 'assets/imagenes/hd1.jpg',
    title: 'Habitación Deluxe 1',
    description: 'Esta es una habitación deluxe con vista al mar.',
  ),
  Room(
    imageUrl: 'assets/imagenes/hd2.jpg',
    title: 'Habitación Deluxe 2',
    description: 'Esta es una habitación deluxe con jacuzzi.',
  ),
];

List<Room> Lujo = [
  Room(
    imageUrl: 'assets/imagenes/sp1.jpg',
    title: 'Suite Presidencial 1',
    description: 'Esta es una suite presidencial con sala de estar y balcón privado.',
  ),
  Room(
    imageUrl: 'assets/imagenes/sp2.jpg',
    title: 'Suite Presidencial 2',
    description: 'Esta es una suite presidencial con piscina privada y vistas panorámicas.',
  ),
];
