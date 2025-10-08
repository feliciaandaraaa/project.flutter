import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pesanan Saya")),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          var order = orders[index];
          return Card(
            child: ListTile(
              title: Text("Pesanan ${index + 1} - Rp ${order.total}"),
              subtitle: Text("Status: ${order.status.name}"),
            ),
          );
        },
      ),
    );
  }
}
