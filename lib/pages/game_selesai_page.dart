import 'package:flutter/material.dart';
import 'home_page.dart'; // <-- Kembali ke HomePage

class GameSelesaiPage extends StatelessWidget {
  // Dummy data untuk skor
  final List<Map<String, dynamic>> dataLevel = [
    {'level': 1, 'judul': 'Sejarah Tuban', 'skor': 120},
    {'level': 2, 'judul': 'Wisata Tuban', 'skor': 150},
    {'level': 3, 'judul': 'Budaya Tuban', 'skor': 180},
    {'level': 4, 'judul': 'Kuliner Tuban', 'skor': 200},
  ];

  GameSelesaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    int totalSkor = dataLevel.fold(0, (sum, item) => sum + (item['skor'] as int));

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                    child: const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Jelajah Tuban Selesai!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF234B76)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Terima kasih sudah menjelajahi keindahan Tuban!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: dataLevel.length,
                itemBuilder: (context, index) {
                  final data = dataLevel[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFFDCEBFA),
                          child: Text('${data['level']}', style: const TextStyle(color: Color(0xFF4A90E2), fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Level ${data['level']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF234B76))),
                              Text(data['judul'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                        Text('${data['skor']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF234B76))),
                        const SizedBox(width: 5),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(color: const Color(0xFF4A90E2), borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 28),
                  const SizedBox(width: 10),
                  const Text('Total Skor', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Text('$totalSkor', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // KEMBALI KE BERANDA (Bukan Login)
                    // Kita gunakan nama default 'Pengguna' atau sesuaikan jika kamu menyimpan nama di variabel global
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage(namaPengguna: 'Pengguna')), 
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF234B76),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Kembali ke Beranda', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}