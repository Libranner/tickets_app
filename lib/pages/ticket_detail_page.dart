import 'package:flutter/material.dart';
import 'package:tickets_app/models/ticket.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailPage({Key key, this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Ticket'),
      ),
      body: Card(
        child: Text(ticket.comment),
      ),
    );
  }
}
