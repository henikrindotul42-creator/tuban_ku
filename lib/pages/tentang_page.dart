import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: const Text('Tentang Aplikasi', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LOGO & NAMA APLIKASI
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A90E2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.landscape_rounded, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'TubanKu',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF234B76)),
                  ),
                  const Text(
                    'Versi 1.0.0',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // DESKRIPSI APLIKASI
            const Text(
              'Tentang TubanKu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF234B76)),
            ),
            const SizedBox(height: 10),
            const Text(
              'TubanKu adalah aplikasi edukasi dan wisata yang dirancang untuk membantu pengguna mengenal lebih dekat Kabupaten Tuban. Aplikasi ini menyajikan informasi lengkap mulai dari sejarah, tempat wisata, kebudayaan, hingga kuliner khas yang ada di Tuban.',
              style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 25),

            // FITUR APLIKASI
            const Text(
              'Fitur Utama:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF234B76)),
            ),
            const SizedBox(height: 10),
            _buildFitur(Icons.info_outline, 'Informasi Lengkap', 'Menyediakan detail sejarah, wisata, budaya, dan kuliner Tuban.'),
            _buildFitur(Icons.search, 'Pencarian & Kategori', 'Memudahkan pengguna mencari informasi berdasarkan kategori.'),
            _buildFitur(Icons.favorite, 'Favorit', 'Simpan informasi atau tempat favoritmu agar mudah diakses kembali.'),
            _buildFitur(Icons.gamepad, 'Game Jelajah Tuban', 'Mini game seru untuk menguji pengetahuanmu tentang Tuban.'),
            const SizedBox(height: 30),

            // FOOTER
            const Center(
              child: Text(
                '© 2026 TubanKu. All rights reserved.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget bantuan untuk menampilkan daftar fitur
  Widget _buildFitur(IconData icon, String judul, String deskripsi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF4A90E2), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF234B76))),
                const SizedBox(height: 4),
                Text(deskripsi, style: const TextStyle(fontSize: 13, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}