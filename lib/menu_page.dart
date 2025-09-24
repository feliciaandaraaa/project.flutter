import 'package:flutter/material.dart';
import 'models/menu_item.dart';
import 'cart_page.dart';

// Global keranjang
List<MenuItem> cart = [];

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // ada 2 tab (Makanan & Minuman)
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Menu Café"),
          backgroundColor: const Color.fromARGB(255, 240, 239, 239),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Makanan", icon: Icon(Icons.fastfood)),
              Tab(text: "Minuman", icon: Icon(Icons.local_drink)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FoodTab(),
            DrinkTab(),
          ],
        ),
      ),
    );
  }
}

class FoodTab extends StatelessWidget {
  const FoodTab({super.key});

  @override
  Widget build(BuildContext context) {
    var foodItems = menuItems.where((item) => item is Food).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolom
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        var item = foodItems[index];
        return _buildMenuCard(context, item);
      },
    );
  }
}

class DrinkTab extends StatelessWidget {
  const DrinkTab({super.key});

  @override
  Widget build(BuildContext context) {
    var drinkItems = menuItems.where((item) => item is Drink).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: drinkItems.length,
      itemBuilder: (context, index) {
        var item = drinkItems[index];
        return _buildMenuCard(context, item);
      },
    );
  }
}

// Card untuk item menu
Widget _buildMenuCard(BuildContext context, MenuItem item) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              item.imagePath, // 🔥 ambil langsung dari model
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/images/food_placeholder.png", // fallback jika gambar error
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text(
            item.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Rp ${item.price.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 9, 9, 9),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton(
            onPressed: () {
              cart.add(item);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item.name} ditambahkan ke keranjang")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Tambah"),
          ),
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}
