import 'package:belajarflutter/pages/account_page.dart';
import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_card.dart';
import 'cart_page.dart';
import 'booking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MenuItem> _menu = [
    MenuItem(name: 'Nasi Goreng', price: 20000, image: 'assets/images/nasi_goreng.png'),
    MenuItem(name: 'Mie Goreng', price: 18000, image: 'assets/images/mie_goreng.png'),
    MenuItem(name: 'Ricebowl', price: 20000, image: 'assets/images/ricebowl.png'),
    MenuItem(name: 'Spaghetti', price: 25000, image: 'assets/images/spaghetti.png'),
    MenuItem(name: 'Es Teh', price: 5000, image: 'assets/images/es_teh.png'),
    MenuItem(name: 'Lemon Tea', price: 7000, image: 'assets/images/lemon_tea.png'),
    MenuItem(name: 'Kopi Hitam', price: 8000, image: 'assets/images/kopi_hitam.png'),
    MenuItem(name: 'Cappuccino', price: 10000, image: 'assets/images/cappuccino.png'),
    MenuItem(name: 'Thai Tea', price: 12000, image: 'assets/images/thai_tea.png'),
    MenuItem(name: 'Matcha', price: 12000, image: 'assets/images/matcha.png'),
  ];

  final List<MenuItem> _cart = [];

  void _addToCart(MenuItem item) {
    setState(() => _cart.add(item));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} ditambahkan ke keranjang!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Billiard & Caffe'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AccountPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage(cartItems: _cart)),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Bagian Akun
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Selamat Datang, Felicia 👋',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Nikmati hidangan dan waktu santai kamu di sini!',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 🔹 Banner Promosi / Info
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green.shade700,
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Promo Spesial Hari Ini 🎉',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Diskon 10% untuk semua menu minuman!',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Judul Menu
            const Text(
              'Menu Kami 🍽️',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BookingPage()),
                );
              },
              icon: const Icon(Icons.event_seat),
              label: const Text('Booking Tempat Billiard'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Daftar Menu
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: _menu.length,
              itemBuilder: (context, index) {
                final item = _menu[index];
                return MenuCard(item: item, onAdd: () => _addToCart(item));
              },
            ),
          ],
        ),
      ),
    );
  }
}
