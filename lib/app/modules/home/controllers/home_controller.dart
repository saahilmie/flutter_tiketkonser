import 'package:get/get.dart';
import '../../../data/models/event_model.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final events = EventModel.sampleEvents;

  void goToEventDetail(EventModel event) {
    Get.toNamed(AppRoutes.eventDetail, arguments: event);
  }

  void goToMyTickets() {
    Get.toNamed(AppRoutes.myTickets);
  }
}