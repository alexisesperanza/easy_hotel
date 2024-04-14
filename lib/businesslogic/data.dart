import '../states/hotel.dart';
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
    title: 'SimpleStay Hotel',
    description: 'Experimenta la simplicidad y la comodidad en nuestro hotel diseñado para viajeros conscientes del presupuesto. Con habitaciones prácticas y una atmósfera acogedora, te proporcionamos todo lo necesario para una estancia sin complicaciones a un precio que te sorprenderá.',
  ),
  Room(
    imageUrl:  'assets/prueba.png',
    title: 'PennySaver Lodge',
    description: 'Descubre el equilibrio perfecto entre calidad y precio en nuestro acogedor hotel. Con tarifas económicas y un ambiente cálido, te ofrecemos una estancia sin complicaciones para que disfrutes al máximo de tu viaje.',
  ),
];

List<Room> Estandar = [
  Room(
    imageUrl: 'assets/prueba.png',
    title: 'Majestic Inn',
    description: 'Descubre la grandeza de una estancia majestuosa en nuestro hotel, donde la arquitectura impresionante y el servicio excepcional se unen para crear una experiencia verdaderamente inolvidable.',
  ),
  Room(
    imageUrl: 'assets/prueba.png',
    title: 'Imperial Hotel',
    description: 'Descubre el esplendor de una era pasada en nuestro hotel imperial, donde el encanto clásico se combina con las comodidades modernas para ofrecerte una experiencia de hospedaje verdaderamente única.',
  ),
];

List<Room> Lujo = [
  Room(
    imageUrl: 'assets/prueba.png',
    title: 'Azure Horizon Resort',
    description: 'Descubre un paraíso de opulencia frente al mar, donde la atención personalizada y las instalaciones exclusivas te transportarán a un mundo de placer y confort.',
  ),
  Room(
    imageUrl: 'assets/prueba.png',
    title: 'Platinum Panorama Palace',
    description: 'Admira vistas panorámicas desde este palacio de lujo, donde cada detalle ha sido cuidadosamente diseñado para ofrecerte una experiencia excepcionalmente lujosa y memorable..',
  ),
];

  final List<Hotel> hotels = [
    Hotel(
      title: 'Habitacion sencilla',
      description: 'Habitacion economica con acceso a comodidades basicas, servicios extra se pagan por separado.',
      imageUrl: 'assets/prueba.png',
    ),
    Hotel(
      title: 'Habitacion doble',
      description: 'Habitacion con acomodacion doble con acomodacion sencilla, servicios extra se pagan por separado.',
      imageUrl: 'assets/prueba.png',
    ),

  ];