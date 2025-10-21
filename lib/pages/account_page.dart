import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  // Fungsi utilitas untuk menampilkan Snackbar
  void _showSnackbar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title diklik!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi keluar
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Keluar"),
          content: const Text("Apakah Anda yakin ingin keluar dari akun ini?"),
          actions: <Widget>[
            TextButton(
              child: Text("Batal", style: TextStyle(color: Colors.green.shade700)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Keluar", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                // Ganti ini dengan logika log out sebenarnya (misalnya, menghapus SharedPreferences)
                _showSnackbar(context, "Anda berhasil Keluar"); 
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Akun Saya"),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Profil Pengguna
            const UserProfileCard(),

            const SizedBox(height: 20),

            // 🔹 Info Koin / Voucher / Rating
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _InfoCard(icon: Icons.monetization_on, label: "Koin", value: "250", color: Colors.amber),
                _InfoCard(icon: Icons.card_giftcard, label: "Voucher", value: "2 Aktif", color: Colors.blue),
                _InfoCard(icon: Icons.star, label: "Rating", value: "4.8 / 5", color: Colors.orange),
              ],
            ),

            const SizedBox(height: 30),

            // 🔹 Menu lainnya (Hanya menyisakan tombol Keluar)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 🚨 Riwayat Pesanan dihapus
                  // 🚨 Menu Favorit dihapus
                  // 🚨 Pengaturan Akun dihapus
                  // 🚨 Bantuan & FAQ dihapus
                  
                  // Menu Keluar
                  _MenuTile(
                    icon: Icons.logout,
                    title: "Keluar",
                    color: Colors.red.shade600,
                    showArrow: false,
                    onTap: () => _showLogoutDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// WIDGET BANTUAN (TETAP SAMA)
// =========================================================

/// Kartu Profil Pengguna
class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage('assets/images/profile.png'), 
            backgroundColor: Colors.lightGreen,
          ),
          const SizedBox(height: 12),
          const Text(
            "Felicia Andara Labdagati",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.badge, size: 16, color: Colors.blueAccent),
              SizedBox(width: 5),
              Text(
                "Level: Gold Member",
                style: TextStyle(color: Colors.blueAccent, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 10),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur Edit Profil belum tersedia 😅'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.edit, size: 20),
            label: const Text("Edit Profil"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Kartu Info Kecil (Koin/Voucher/Rating)
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

/// Menu List Tile yang lebih interaktif
class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;
  final bool showArrow;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    this.color,
    this.showArrow = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              // Cek apakah ini tombol terakhir ("Keluar")
              color: title != "Keluar" ? Colors.grey.shade200 : Colors.transparent, 
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: color ?? Colors.green.shade700),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color ?? Colors.black87,
                  fontWeight: title == "Keluar" ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (showArrow)
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}