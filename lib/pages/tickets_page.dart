import 'package:flutter/material.dart';
import 'package:tickets_app/models/ticket.dart';

class TicketsPage extends StatelessWidget {
  final tickets = [
    Ticket(
      1,
      "Lina",
      "https://bit.ly/3ahQMat",
      DateTime.now(),
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
    Ticket(
      2,
      "Mauriel",
      "https://bit.ly/3eydwX0",
      DateTime.now(),
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
    Ticket(
      3,
      "Maurier",
      "https://bit.ly/2ysyqWW",
      DateTime.now(),
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
    Ticket(
      4,
      "El Bobo Mentao'",
      "https://bit.ly/2yoMBMQ",
      DateTime.now(),
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tickets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildTicketList(tickets: tickets),
      ),
    );
  }

  Widget _buildTicketList({List<Ticket> tickets}) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return _buildTicketListItem(tickets[index]);
      },
      separatorBuilder: (_, index) => SizedBox(
        height: 5.0,
      ),
      itemCount: tickets.length,
    );
  }

  void _showTicketDetail(BuildContext context, Ticket ticket) {
    Navigator.of(context).pushNamed('/ticket_detail', arguments: ticket);
    /*showDialog(
      context: context,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: TicketDetailPage(
          ticket: ticket,
        ),
      ),
      useRootNavigator: false,
    );*/
  }

  Widget _buildTicketListItem(Ticket ticket) {
    return Builder(
      builder: (context) {
        return Card(
          key: Key('ticket-${ticket.id}'),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _showTicketDetail(context, ticket),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ListTile(
                leading: AspectRatio(
                  aspectRatio: 1.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(ticket.userPhotoUrl),
                  ),
                ),
                title: Text(
                  ticket.name,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket.date.toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      ticket.comment,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
