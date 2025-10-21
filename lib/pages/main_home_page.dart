// pages/main_home_page.dart

import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  final String username;
  const MainHomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Selamat Datang
            Text(
              'Halo, ${username}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Siap main billiard atau ngopi hari ini?',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // Tombol Utama: Booking Tempat
            ElevatedButton(
              onPressed: () {
                // TODO: Aksi navigasi ke halaman Booking, 
                // atau set index BottomNavBar ke Booking (index 1)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigasi ke halaman Booking...'))
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60), // Lebar penuh
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sports_baseball, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'BOOKING MEJA BILLIARD',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Bagian Info Lain (misalnya promo atau menu populer)
            const Text(
              'Promo Hari Ini',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // ... Tambahkan widget lain di sini
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                'assets/images/f.png', // Ganti dengan path gambar promo Anda
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}