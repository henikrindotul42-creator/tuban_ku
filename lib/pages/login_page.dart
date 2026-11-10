import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'home_page.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Sekarang kita gunakan controller untuk Nama
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _obscurePassword = true; 

  // ATURAN PASSWORD ASLI DI SINI
  final String _passwordBenar = 'anakbaik'; 

  void _prosesLogin() {
    String nama = _namaController.text.trim();
    String password = _passwordController.text.trim();

    // 1. Cek apakah kolom kosong
    if (nama.isEmpty || password.isEmpty) {
      _tampilkanPesan('Nama dan Password tidak boleh kosong!');
      return;
    }

    // 2. Cek apakah password sesuai
    if (password != _passwordBenar) {
      _tampilkanPesan('Password yang Anda masukkan salah!');
      return;
    }

    // 3. Jika password benar, login berhasil dan kirim nama ke HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage(namaPengguna: nama)),
    );
  }

  void _tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(Icons.landscape_rounded, size: 60, color: Colors.white),
                ),
                const SizedBox(height: 24),
                const Text(
                  'TubanKu',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.darkBlue),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Kenali Tuban lebih dekat',
                  style: TextStyle(fontSize: 14, color: AppTheme.darkBlue),
                ),
                const SizedBox(height: 40),

                // INPUT NAMA
                TextField(
                  controller: _namaController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama',
                    prefixIcon: const Icon(Icons.person_outline, color: AppTheme.primaryBlue),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),

                // INPUT PASSWORD
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Password',
                    prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.primaryBlue),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: AppTheme.primaryBlue),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 24),

                // TOMBOL MASUK
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _prosesLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('MASUK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Selamat datang di TubanKu', style: TextStyle(color: AppTheme.darkBlue, fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}