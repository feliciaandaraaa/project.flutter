// pages/menu_page.dart

import 'package:flutter/material.dart';

// ====================================================================
// Bagian 1 & 2: Definisi Model dan Data (Salin dari bagian 2 di atas)
// ====================================================================

// (SALIN SEMUA CLASS DAN LIST menuItems DI SINI)

class MenuItem {
  String name;
  double price;
  String imagePath;

  MenuItem(this.name, this.price, this.imagePath);
}

class Food extends MenuItem {
  Food(String name, double price, String imagePath)
      : super(name, price, imagePath);
}

class Drink extends MenuItem {
  Drink(String name, double price, String imagePath)
      : super(name, price, imagePath);
}

List<MenuItem> menuItems = [
  Food("Nasi Goreng", 20000, "assets/images/nasi_goreng.png"),
  Food("Mie Goreng", 18000, "assets/images/mie_goreng.png"),
  Food("Ricebowl", 20000, "assets/images/ricebowl.png"),
  Food("Spaghetti", 25000, "assets/images/spaghetti.png"),
  Drink("Es Teh", 5000, "assets/images/es_teh.png"),
  Drink("Lemon Tea", 7000, "assets/images/lemon_tea.png"),
  Drink("Kopi Hitam", 8000, "assets/images/kopi_hitam.png"),
  Drink("Cappuccino", 10000, "assets/images/cappuccino.png"),
  Drink("Thai Tea", 12000, "assets/images/thai_tea.png"),
  Drink("Matcha", 12000, "assets/images/matcha.png"),
];

// ====================================================================
// Bagian 3: Widget MenuPage (Dengan Kait Add to Cart)
// ====================================================================

class MenuPage extends StatelessWidget {
  final Function(MenuItem item) onAddToCart;
  
  const MenuPage({super.key, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> foods = menuItems.whereType<Food>().toList();
    final List<MenuItem> drinks = menuItems.whereType<Drink>().toList();

    return ListView(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      children: [
        _buildMenuCategory('🍽️ Makanan Berat', foods, onAddToCart),
        _buildMenuCategory('☕ Minuman & Kopi', drinks, onAddToCart),
      ],
    );
  }

  Widget _buildMenuCategory(String title, List<MenuItem> items, Function(MenuItem item) onAddToCart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ),
        ...items.map((item) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          elevation: 2,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                item.imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60, height: 60,
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8.0)),
                    child: const Icon(Icons.fastfood, size: 30, color: Colors.grey),
                  );
                },
              ),
            ),
            title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Harga: Rp ${item.price.toStringAsFixed(0)}'),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart, color: Colors.green),
              onPressed: () {
                onAddToCart(item); // 🔥 Panggilan Add to Cart
              },
            ),
          ),
        )).toList(),
        const SizedBox(height: 20),
      ],
    );
  }
}