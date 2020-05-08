import 'package:flutter/material.dart';
import 'package:tickets_app/models/ticket.dart';
import 'package:tickets_app/pages/ticket_detail_page.dart';
import 'package:tickets_app/pages/tickets_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => TicketsPage());
      case '/ticket_detail':
        return MaterialPageRoute(
          builder: (_) => TicketDetailPage(
            ticket: args as Ticket,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => TicketsPage());
    }
  }
}
