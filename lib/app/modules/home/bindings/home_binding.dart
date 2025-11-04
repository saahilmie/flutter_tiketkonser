import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../my_tickets/controllers/my_tickets_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(MyTicketsController());
  }
}
