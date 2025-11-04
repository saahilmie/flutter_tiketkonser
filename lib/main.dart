import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/modules/my_tickets/controllers/my_tickets_controller.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MyTicketsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tiket Konser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF64B5F6), // Biru muda
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Chilanka',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF64B5F6),
          primary: const Color(0xFF64B5F6),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Chilanka',
          ),
        ),
      ),
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.routes,
    );
  }
}