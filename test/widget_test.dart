import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_hotel/events/main.dart';

void main() {
  testWidgets('HotelHomePage muestra correctamente el título', (WidgetTester tester) async {
    // Construye el widget
    await tester.pumpWidget(MaterialApp(home: HotelHomePage()));

    // Verifica que se muestra el título
    expect(find.text('EasyHotel'), findsOneWidget);
  });

  testWidgets('HotelHomePage muestra correctamente la información inicial', (WidgetTester tester) async {
    // Construye el widget
    await tester.pumpWidget(MaterialApp(home: HotelHomePage()));

    // Verifica que se muestra el mensaje de bienvenida
    expect(find.text('Bienvenido al Hotel'), findsOneWidget);


  });

  // Agrega más pruebas aquí para otros casos de uso de HotelHomePage si es necesario
}
