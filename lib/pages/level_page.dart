import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';
import 'gameplay_page.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  int levelTerbuka = 1; // Default hanya level 1 yang terbuka
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _muatProgresLevel();
  }

  // Fungsi untuk memuat data dari memori HP
  Future<void> _muatProgresLevel() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      levelTerbuka = prefs.getInt('levelTerbuka') ?? 1;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Jelajah Tuban'),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        // TAMBAHAN: Tombol Back untuk kembali ke Beranda
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildLevelCard(1, 'Sejarah Tuban'),
                const SizedBox(height: 12),
                _buildLevelCard(2, 'Wisata Tuban'),
                const SizedBox(height: 12),
                _buildLevelCard(3, 'Budaya Tuban'),
                const SizedBox(height: 12),
                _buildLevelCard(4, 'Kuliner Tuban'),
              ],
            ),
    );
  }

  Widget _buildLevelCard(int levelId, String judul) {
    // Cek apakah level ini terbuka atau masih terkunci
    bool isUnlocked = levelId <= levelTerbuka;

    return GestureDetector(
      onTap: () {
        if (isUnlocked) {
          // Jika terbuka, masuk ke game
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GameplayPage(levelId: levelId),
            ),
          ).then((_) => _muatProgresLevel()); // Muat ulang saat kembali
        } else {
          // Jika terkunci, munculkan pesan
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Selesaikan level sebelumnya terlebih dahulu!'),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD3EAF7)),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isUnlocked ? Colors.blue.shade100 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isUnlocked ? Icons.play_arrow_rounded : Icons.lock_rounded,
                color: isUnlocked ? AppTheme.primaryBlue : Colors.grey,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level $levelId',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    judul,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isUnlocked ? 'Mulai permainan' : 'Selesaikan level sebelumnya',
                    style: TextStyle(
                      fontSize: 12,
                      color: isUnlocked ? AppTheme.primaryBlue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isUnlocked ? Icons.chevron_right_rounded : Icons.lock_outline_rounded,
              color: isUnlocked ? AppTheme.primaryBlue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}