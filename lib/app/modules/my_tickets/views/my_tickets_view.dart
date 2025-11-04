import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_tickets_controller.dart';
import '../../../data/models/ticket_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyTicketsView extends StatelessWidget {
  const MyTicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MyTicketsController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ctrl.goToHome(),
        ),
        title: const Text('Tiket Saya'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (ctrl.tickets.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.confirmation_num_outlined,
                    size: 72, color: Color(0xFF64B5F6)),
                SizedBox(height: 18),
                Text('Belum ada tiket yang dibeli',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: ctrl.tickets.length,
          itemBuilder: (context, index) {
            final t = ctrl.tickets[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(t.imageUrl,
                      width: 70, height: 70, fit: BoxFit.cover),
                ),
                title: Text(t.eventTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text('${t.type} - Rp ${t.price}'),
                onTap: () => _showTicketDetail(context, t),
              ),
            );
          },
        );
      }),
    );
  }

void _showTicketDetail(BuildContext context, TicketModel ticket) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(ticket.imageUrl,
                      height: 160, width: double.infinity, fit: BoxFit.cover),
                ),
                const SizedBox(height: 16),
                Text(ticket.eventTitle,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('${ticket.type} - Rp ${ticket.price}',
                    style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.calendar_today_outlined,
                        color: Color(0xFF64B5F6), size: 18),
                    const SizedBox(width: 6),
                    Text(ticket.date),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: Color(0xFF64B5F6), size: 18),
                    const SizedBox(width: 6),
                    Expanded(child: Text(ticket.location)),
                  ],
                ),
                const SizedBox(height: 16),

                // ✅ QR CODE di bawah
                QrImageView(
                  data: 'TICKET_ID:${ticket.id}|EVENT:${ticket.eventTitle}|TYPE:${ticket.type}|PRICE:${ticket.price}',
                  version: QrVersions.auto,
                  size: 120.0,
                  eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: Color(0xFF64B5F6),
                  ),
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: Color(0xFF64B5F6),
                  ),
                ),

                const SizedBox(height: 8),
                const Text(
                  'Tunjukkan kode ini saat memasuki konser 🎫',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),

          // Tombol X di pojok kiri atas
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black54),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    ),
  );
}
}