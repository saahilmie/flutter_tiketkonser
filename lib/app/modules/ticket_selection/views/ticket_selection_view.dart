import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ticket_selection_controller.dart';
import '../../../data/models/event_model.dart';

class TicketSelectionView extends StatelessWidget {
  const TicketSelectionView({Key? key}) : super(key: key);

  Widget _quantityControl(String label, RxInt value, VoidCallback inc, VoidCallback dec, int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$label - Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+$)'), (m) => '${m[1]}.')}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            IconButton(onPressed: dec, icon: const Icon(Icons.remove_circle_outline)),
            Obx(() => Text('${value.value}', style: const TextStyle(fontSize: 16))),
            IconButton(onPressed: inc, icon: const Icon(Icons.add_circle_outline)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<TicketSelectionController>();
    final EventModel event = ctrl.event;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text('Pilih Tiket - ${event.title}'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Image.asset(event.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                title: Text(event.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(event.date),
              ),
            ),
            const SizedBox(height: 18),
            _quantityControl('VIP', ctrl.vipQuantity, ctrl.incrementVip, ctrl.decrementVip, event.vipPrice),
            const SizedBox(height: 12),
            _quantityControl('Reguler', ctrl.regularQuantity, ctrl.incrementRegular, ctrl.decrementRegular, event.regularPrice),
            const SizedBox(height: 24),
            Obx(() => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Tiket', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${ctrl.totalTickets}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Harga', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Rp ${ctrl.totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+$)'), (m) => '${m[1]}.')}'),
                  ],
                ),
              ],
            )),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ctrl.confirmPurchase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF64B5F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Konfirmasi & Bayar Sekarang',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
