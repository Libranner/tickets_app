import 'package:flutter/material.dart';
import 'package:tickets_app/pages/tickets_page.dart';
import 'package:tickets_app/route_generator.dart';

void main() => runApp(TicketApp());

class TicketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket App',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TicketsPage(),
    );
  }
}
