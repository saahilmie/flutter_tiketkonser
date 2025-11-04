import 'package:get/get.dart';
import '../../../data/models/ticket_model.dart';
import '../../../routes/app_routes.dart';

class MyTicketsController extends GetxController {
  // daftar tiket yang dibeli
  var tickets = <TicketModel>[].obs;

  void addTicket(TicketModel ticket) {
    tickets.add(ticket);
  }

  void goToHome() {
    Get.offAllNamed(AppRoutes.home);
  }
}
