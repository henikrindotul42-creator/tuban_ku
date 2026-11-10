import 'package:flutter/material.dart';
import 'login_page.dart';
import 'tentang_page.dart'; // <-- Tambahan import halaman baru

class AccountPage extends StatelessWidget {
  final String namaPengguna;

  const AccountPage({super.key, required this.namaPengguna});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: const Text('Akun', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(color: Color(0xFFDCEBFA), shape: BoxShape.circle),
              child: const Icon(Icons.person, size: 55, color: Color(0xFF4A90E2)),
            ),
            const SizedBox(height: 16),
            Text(
              namaPengguna, 
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFF234B76)),
            ),
            const SizedBox(height: 6),
            const Text('Kenali Tuban lebih dekat', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 30),

            // MENU TENTANG APLIKASI
            _buildMenu(
              icon: Icons.info_outline,
              title: 'Tentang Aplikasi',
              onTap: () {
                // Berpindah ke halaman Tentang
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TentangPage()),
                );
              },
            ),
            const SizedBox(height: 20),

            // TOMBOL KELUAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Keluar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu({required IconData icon, required String title, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(color: const Color(0xFFDCEBFA), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: const Color(0xFF4A90E2)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF234B76))),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}