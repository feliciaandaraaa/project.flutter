// pages/splash_screen.dart

import 'package:flutter/material.dart';
import 'login_page.dart'; // Pastikan file ini ada

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Asumsi: LoginPage memiliki constructor default
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/f.png', width: 180, height: 180),
            const SizedBox(height: 20),
            const Text(
              "Billiard Caffe App",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),
            const Text("Tempat seru, nikmati kopi dan billiard!", style: TextStyle(color: Colors.black54)),
            
            // Indikator Loading
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              strokeWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}