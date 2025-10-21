import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const MenuCard({super.key, required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Image.asset(item.image, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Rp ${item.price.toStringAsFixed(0)}'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onAdd,
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
