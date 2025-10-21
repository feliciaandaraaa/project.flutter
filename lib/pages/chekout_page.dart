import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final double total;

  const CheckoutPage({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total Pembayaran Anda:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Rp ${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // Simulasi pembayaran
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pembayaran berhasil! 🎉'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  // Kembali ke halaman awal
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
                icon: const Icon(Icons.check_circle),
                label: const Text(
                  'Konfirmasi Pembayaran',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
