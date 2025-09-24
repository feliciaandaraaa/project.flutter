import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'models/order.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? selectedPayment;

  double getTotal() {
    return cart.fold(0, (sum, item) => sum + item.price);
  }

  void confirmOrder() {
    if (selectedPayment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pilih metode pembayaran dulu!")),
      );
      return;
    }

    // Buat order baru
    orders.add(
      Order(List.from(cart), getTotal()),
    );

    cart.clear(); // kosongkan keranjang

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Pesanan berhasil! Metode: $selectedPayment")),
    );

    Navigator.pop(context); // kembali ke cart / home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Metode Pembayaran:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: const Text("Cash"),
              value: "Cash",
              groupValue: selectedPayment,
              onChanged: (value) => setState(() => selectedPayment = value),
            ),
            RadioListTile(
              title: const Text("Transfer Bank"),
              value: "Transfer Bank",
              groupValue: selectedPayment,
              onChanged: (value) => setState(() => selectedPayment = value),
            ),
            RadioListTile(
              title: const Text("QRIS"),
              value: "QRIS",
              groupValue: selectedPayment,
              onChanged: (value) => setState(() => selectedPayment = value),
            ),
            const SizedBox(height: 20),
            Text(
              "Total: Rp ${getTotal()}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: confirmOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Konfirmasi Bayar"),
            ),
          ],
        ),
      ),
    );
  }
}
