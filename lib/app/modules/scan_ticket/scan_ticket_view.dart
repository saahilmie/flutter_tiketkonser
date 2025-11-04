import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';

class ScanTicketView extends StatelessWidget {
  const ScanTicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemeriksaan Tiket'),
        backgroundColor: const Color(0xFF64B5F6),
      ),
      body: MobileScanner(
        onDetect: (capture) {
          final barcode = capture.barcodes.first;
          if (barcode.rawValue != null) {
            final String code = barcode.rawValue!;
            Get.snackbar(
              'QR Code Terdeteksi ✅',
              code,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.shade400,
              colorText: Colors.white,
            );
          }
        },
      ),
    );
  }
}
