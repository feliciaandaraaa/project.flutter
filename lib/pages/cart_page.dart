import 'package:flutter/material.dart';
import 'checkout_page.dart';
import 'menu_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  double getTotal() {
    return cart.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                var item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("Rp ${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cart.removeAt(index);
                      (context as Element).markNeedsBuild();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Total: Rp ${getTotal()}"),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (cart.isNotEmpty) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutPage()));
                    }
                  },
                  child: const Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
