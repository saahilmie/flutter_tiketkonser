import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../modules/scan_ticket/scan_ticket_view.dart';

// Bindings
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/ticket_selection/bindings/ticket_selection_binding.dart';
import '../modules/my_tickets/bindings/my_tickets_binding.dart';

// Views
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/ticket_selection/views/ticket_selection_view.dart';
import '../modules/my_tickets/views/my_tickets_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.eventDetail,
      page: () => const EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.ticketSelection,
      page: () => const TicketSelectionView(),
      binding: TicketSelectionBinding(),
    ),
    GetPage(
      name: AppRoutes.myTickets,
      page: () => const MyTicketsView(),
      binding: MyTicketsBinding(),
    ),
    GetPage(
      name: AppRoutes.scanTicket,
      page: () => const ScanTicketView(),
    ),
  ];
}
