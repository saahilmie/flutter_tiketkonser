class TicketModel {
  final String id;
  final String eventId;
  final String eventTitle;
  final String date;
  final String location;
  final String type; // VIP / Reguler
  final int price;
  final String? seat;
  final String imageUrl;

  TicketModel({
    required this.id,
    required this.eventId,
    required this.eventTitle,
    required this.date,
    required this.location,
    required this.type,
    required this.price,
    this.seat,
    required this.imageUrl,
  });

  static List<TicketModel> sampleTickets = [
    TicketModel(
    id: 't1',
    eventId: '1',
    eventTitle: 'Blue Moon Music Festival 💙',
    date: '15 Desember 2025',
    location: 'Stadion Utama Jakarta',
    type: 'VIP',
    price: 500000,
    seat: 'A1',
    imageUrl: 'assets/images/confetti1.jpg',),
  ];
}
