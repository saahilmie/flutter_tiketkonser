import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/event_model.dart';
import '../../../data/models/ticket_model.dart';
import '../../../routes/app_routes.dart';
import '../../my_tickets/controllers/my_tickets_controller.dart';

class TicketSelectionController extends GetxController {
  late EventModel event;

  final vipQuantity = 0.obs;
  final regularQuantity = 0.obs;

  @override
  void onInit() {
    super.onInit();
    event = Get.arguments as EventModel;
  }

  void incrementVip() {
    if (vipQuantity.value < 10) vipQuantity.value++;
  }

  void decrementVip() {
    if (vipQuantity.value > 0) vipQuantity.value--;
  }

  void incrementRegular() {
    if (regularQuantity.value < 10) regularQuantity.value++;
  }

  void decrementRegular() {
    if (regularQuantity.value > 0) regularQuantity.value--;
  }

  int get totalPrice {
    return (vipQuantity.value * event.vipPrice) +
        (regularQuantity.value * event.regularPrice);
  }

  int get totalTickets {
    return vipQuantity.value + regularQuantity.value;
  }

  void confirmPurchase() {
    if (totalTickets > 0) {
      final myTicketsCtrl = Get.find<MyTicketsController>();

      if (vipQuantity.value > 0) {
        myTicketsCtrl.tickets.add(
          TicketModel(
            id: DateTime.now().millisecondsSinceEpoch
                .toString(),
            eventId: event.id.toString(),
            eventTitle: event.title,
            date: event.date,
            location: event.location,
            type: 'VIP',
            price: event.vipPrice,
            seat: 'A${vipQuantity.value}',
            imageUrl: event.imageUrl,
          ),
        );
      }

      if (regularQuantity.value > 0) {
        myTicketsCtrl.tickets.add(
          TicketModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            eventId: event.id.toString(),
            eventTitle: event.title,
            date: event.date,
            location: event.location,
            type: 'Reguler',
            price: event.regularPrice,
            seat: 'B${regularQuantity.value}',
            imageUrl: event.imageUrl,
          ),
        );
      }

      Get.snackbar(
        '✅ Pembelian Berhasil!',
        'Tiket berhasil dibeli. Cek di halaman Tiket Saya 💙',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF64B5F6),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed(AppRoutes.myTickets);
      });
    } else {
      Get.snackbar(
        '⚠️ Pilih Tiket',
        'Silakan pilih minimal 1 tiket',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }
}
