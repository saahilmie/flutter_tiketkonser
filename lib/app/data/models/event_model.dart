class EventModel {
  final String id;
  final String title;
  final String date;
  final String location;
  final String description;
  final String category;
  final String imageUrl;
  final int vipPrice;
  final int regularPrice;

  EventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.vipPrice,
    required this.regularPrice,
  });

  // Sample data
  static List<EventModel> sampleEvents = [
    EventModel(
      id: '1',
      title: 'Blue Moon Music Festival 💙',
      date: '15 Desember 2025',
      location: 'Stadion Utama Jakarta',
      description:
          'Festival musik tahunan terbesar dengan lineup artis internasional dan lokal. Nikmati pengalaman konser yang tak terlupakan dengan stage production kelas dunia!',
      category: 'Musik',
      imageUrl: 'assets/images/confetti1.jpg',
      vipPrice: 500000,
      regularPrice: 250000,
    ),
    EventModel(
      id: '2',
      title: 'Rock Night Experience 💙',
      date: '20 November 2025',
      location: 'Arena Indoor Bandung',
      description:
          'Malam rock legendaris dengan band-band ternama. Rasakan energi musik rock yang menggelegar!',
      category: 'Musik',
      imageUrl: 'assets/images/confetti1.jpg',
      vipPrice: 450000,
      regularPrice: 200000,
    ),
    EventModel(
      id: '3',
      title: 'Jazz Under The Stars 💙',
      date: '10 Desember 2025',
      location: 'Taman Budaya Surabaya',
      description:
          'Konser jazz outdoor dengan suasana romantis di bawah bintang. Perfect untuk date night!',
      category: 'Musik',
      imageUrl: 'assets/images/confetti1.jpg',
      vipPrice: 350000,
      regularPrice: 150000,
    ),
    EventModel(
      id: '4',
      title: 'Football Championship Final',
      date: '25 November 2025',
      location: 'Stadion Gelora Bung Karno',
      description:
          'Pertandingan final championship yang dinanti-nanti! Saksikan pertarungan sengit tim-tim terbaik.',
      category: 'Olahraga',
      imageUrl: 'assets/images/confetti1.jpg',
      vipPrice: 600000,
      regularPrice: 300000,
    ),
    EventModel(
      id: '5',
      title: 'Tech & Business Summit 2025',
      date: '5 Desember 2025',
      location: 'Convention Center Jakarta',
      description:
          'Seminar teknologi dan bisnis dengan pembicara dari perusahaan Fortune 500. Expand your network!',
      category: 'Seminar',
      imageUrl: 'assets/images/confetti1.jpg',
      vipPrice: 800000,
      regularPrice: 400000,
    ),
  ];
}