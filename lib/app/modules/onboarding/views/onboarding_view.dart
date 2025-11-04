import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<OnboardingController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // header gambar
            Container(
              width: double.infinity,
              height: 320,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/confetti1.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Selamat datang di\nTiket Konser 💙',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Chilanka',
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Temukan event musik yang sedang berlangsung dan yang akan hadir — beli tiket dengan mudah.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: ctrl.goToHome,
                  icon: const Text('💙', style: TextStyle(fontSize: 20)),
                  label: const Text(
                    'Cari Event',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF64B5F6),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    textStyle: const TextStyle(fontFamily: 'Chilanka'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
