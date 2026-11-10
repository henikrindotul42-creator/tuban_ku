import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';
import 'level_page.dart';
import 'game_selesai_page.dart';

class LevelResultPage extends StatefulWidget {
  final int levelId;
  final int skor;

  const LevelResultPage({
    super.key,
    required this.levelId,
    required this.skor,
  });

  @override
  State<LevelResultPage> createState() => _LevelResultPageState();
}

class _LevelResultPageState extends State<LevelResultPage> {
  @override
  void initState() {
    super.initState();
    _simpanProgresLevel();
  }

  Future<void> _simpanProgresLevel() async {
    final prefs = await SharedPreferences.getInstance();
    int levelTerbuka = prefs.getInt('levelTerbuka') ?? 1;
    
    // Logika: Hanya buka level berikutnya jika level saat ini diselesaikan
    if (widget.levelId >= levelTerbuka) {
      await prefs.setInt('levelTerbuka', widget.levelId + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLevelTerakhir = widget.levelId == 4;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
              const SizedBox(height: 20),
              Text(
                'Level ${widget.levelId} Selesai!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkBlue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Skor Kamu: ${widget.skor}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (isLevelTerakhir) {
                      // Pindah ke halaman rekap skor total
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => GameSelesaiPage()),
                        (route) => false,
                      );
                    } else {
                      // Kembali ke daftar level
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LevelPage()),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isLevelTerakhir ? 'Lihat Hasil Akhir' : 'Lanjut ke Level Berikutnya',
                    style: const TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}