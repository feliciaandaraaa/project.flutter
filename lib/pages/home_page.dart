import 'package:flutter/material.dart';
import 'booking_page.dart';
import 'menu_page.dart';
import 'order_status_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, size: 35, color: color),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("🎱 Billiard & Café"),
        centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 4,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildMenuCard(
            icon: Icons.table_bar,
            title: "Booking Meja",
            color: Colors.green,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BookingPage()),
            ),
          ),
          _buildMenuCard(
            icon: Icons.restaurant_menu,
            title: "Menu Café",
            color: Colors.orange,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MenuPage()),
            ),
          ),
          _buildMenuCard(
            icon: Icons.receipt_long,
            title: "Pesanan Saya",
            color: Colors.blue,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrderStatusPage()),
            ),
          ),
        ],
      ),
    );
  }
}
