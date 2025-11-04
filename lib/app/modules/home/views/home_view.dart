import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/event_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeController>();
    final bannerEvent = ctrl.events.first;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Konser'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: ctrl.goToMyTickets,
            icon: const Icon(Icons.confirmation_num_outlined),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // banner
            GestureDetector(
              onTap: () => ctrl.goToEventDetail(bannerEvent),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF64B5F6),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(bannerEvent.imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.15), BlendMode.darken),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      bannerEvent.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Chilanka',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Event list
            const Text('Event Minggu Ini', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...ctrl.events.map((e) => _eventCard(e, ctrl)).toList(),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  Widget _eventCard(EventModel e, HomeController ctrl) {
    return GestureDetector(
      onTap: () => ctrl.goToEventDetail(e),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.asset(e.imageUrl, width: 110, height: 90, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text('${e.date} • ${e.location}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.music_note, size: 16),
                        const SizedBox(width: 6),
                        Text(e.category, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
