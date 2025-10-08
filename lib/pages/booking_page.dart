import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  TimeOfDay? _jamBooking;
  String? _metodePembayaran; // 🔥 Tambahan: metode pembayaran

  void _pilihJam() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _jamBooking = picked;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate() &&
        _jamBooking != null &&
        _metodePembayaran != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Meja berhasil dipesan oleh ${_namaController.text}, "
              "untuk ${_jumlahController.text} orang, "
              "jam ${_jamBooking!.format(context)}, "
              "pembayaran: $_metodePembayaran"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Harap lengkapi semua data booking"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Meja"),
        backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nama
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Pemesan",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Nama harus diisi" : null,
              ),
              const SizedBox(height: 20),

              // Jumlah orang
              TextFormField(
                controller: _jumlahController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Jumlah Orang",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Jumlah orang harus diisi" : null,
              ),
              const SizedBox(height: 20),

              // Jam Booking
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.access_time),
                title: Text(
                  _jamBooking == null
                      ? "Pilih Jam Booking"
                      : "Jam: ${_jamBooking!.format(context)}",
                ),
                trailing: ElevatedButton(
                  onPressed: _pilihJam,
                  child: const Text("Pilih"),
                ),
              ),
              const SizedBox(height: 20),

              // 🔥 Metode Pembayaran
              DropdownButtonFormField<String>(
                value: _metodePembayaran,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Metode Pembayaran",
                  prefixIcon: Icon(Icons.payment),
                ),
                items: const [
                  DropdownMenuItem(value: "Cash", child: Text("Cash")),
                  DropdownMenuItem(value: "Transfer Bank", child: Text("Transfer Bank")),
                  DropdownMenuItem(value: "QRIS", child: Text("QRIS")),
                ],
                onChanged: (value) {
                  setState(() {
                    _metodePembayaran = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Pilih metode pembayaran" : null,
              ),
              const SizedBox(height: 30),

              // Tombol submit
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 240, 239, 239),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Pesan Meja",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
