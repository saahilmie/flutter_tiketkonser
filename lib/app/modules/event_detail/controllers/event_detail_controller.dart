import 'package:get/get.dart';
import '../../../data/models/event_model.dart';
import '../../../routes/app_routes.dart';

class EventDetailController extends GetxController {
  late EventModel event;

  @override
  void onInit() {
    super.onInit();
    event = Get.arguments as EventModel;
  }

  void goToTicketSelection() {
    Get.toNamed(AppRoutes.ticketSelection, arguments: event);
  }
}