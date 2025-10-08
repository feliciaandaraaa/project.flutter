import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_card.dart';

// Global keranjang
List<MenuItem> cart = [];

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // ada 2 tab: makanan & minuman
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Menu Café"),
          backgroundColor: const Color.fromARGB(255, 240, 239, 239),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Keranjang masih kosong 😅")),
                );
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.black,
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
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        var item = foodItems[index];
        return MenuCard(
          item: item,
          onAdd: () {
            cart.add(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${item.name} ditambahkan ke keranjang")),
            );
          },
        );
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
        return MenuCard(
          item: item,
          onAdd: () {
            cart.add(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${item.name} ditambahkan ke keranjang")),
            );
          },
        );
      },
    );
  }
}
