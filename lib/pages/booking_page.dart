import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int? selectedTable;

  final List<int> availableTables = List.generate(10, (index) => index + 1); // Meja 1 - 10

  void _selectDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  void _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  void _submitBooking() {
    if (selectedDate != null && selectedTime != null && selectedTable != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booking berhasil untuk Meja $selectedTable pada ${selectedDate!.toLocal()} ${selectedTime!.format(context)}'),
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.pop(context); // Kembali ke Home setelah booking
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan lengkapi semua data booking!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Meja Billiard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: const Text('Tanggal Booking'),
              subtitle: Text(selectedDate != null ? '${selectedDate!.toLocal()}'.split(' ')[0] : 'Belum dipilih'),
              trailing: const Icon(Icons.calendar_today),
              onTap: _selectDate,
            ),
            ListTile(
              title: const Text('Jam Booking'),
              subtitle: Text(selectedTime != null ? selectedTime!.format(context) : 'Belum dipilih'),
              trailing: const Icon(Icons.access_time),
              onTap: _selectTime,
            ),
            DropdownButtonFormField<int>(
              value: selectedTable,
              decoration: const InputDecoration(labelText: 'Pilih Nomor Meja'),
              items: availableTables.map((table) {
                return DropdownMenuItem<int>(
                  value: table,
                  child: Text('Meja $table'),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedTable = value),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.check_circle),
              label: const Text('Konfirmasi Booking'),
              onPressed: _submitBooking,
            ),
          ],
        ),
      ),
    );
  }
}
