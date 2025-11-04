import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/event_detail_controller.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<EventDetailController>();
    final event = ctrl.event;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Detail Event'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(event.imageUrl, width: double.infinity, height: 220, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(event.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 8),
                      Text(event.date),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 8),
                      Expanded(child: Text(event.location)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(event.description, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: ctrl.goToTicketSelection,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF64B5F6),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            'Beli Tiket',
                            style:TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
