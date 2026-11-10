import 'package:flutter/material.dart';

import '../data/informasi_data.dart';
import '../models/informasi.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/informasi_image.dart';

import 'account_page.dart';
import 'all_information_page.dart';
import 'detail_page.dart';
import 'favorite_page.dart';
import 'level_page.dart';

class HomePage extends StatefulWidget {
  final String namaPengguna; // <-- Menerima nama dari Login

  const HomePage({super.key, required this.namaPengguna}); // <-- Wajib diisi

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String kategoriAktif = 'Semua';
  bool tampilkanSemua = false;

  final TextEditingController searchController = TextEditingController();

  final List<Informasi> daftarInformasi = informasiData;
  final List<Informasi> daftarFavorit = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  bool isFavorite(Informasi item) {
    return daftarFavorit.any((e) => e.id == item.id);
  }

  void toggleFavorite(Informasi item) {
    final sudahFavorit = isFavorite(item);

    setState(() {
      if (sudahFavorit) {
        daftarFavorit.removeWhere((e) => e.id == item.id);
      } else {
        daftarFavorit.add(item);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          sudahFavorit
              ? '${item.judul} dihapus dari Favorit'
              : '${item.judul} ditambahkan ke Favorit',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void changeNavigation(int index) {
    setState(() => currentIndex = index);
  }

  void pilihKategori(String kategori) {
    setState(() {
      kategoriAktif = kategori;
      tampilkanSemua = true;
      currentIndex = 0;
      searchController.clear();
    });
  }

  void bukaSemuaInformasi() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AllInformationPage(
          informasi: daftarInformasi,
          isFavorite: isFavorite,
          onFavorite: toggleFavorite,
        ),
      ),
    );
  }

  void bukaDetail(Informasi item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPage(informasi: item),
      ),
    );
  }

  void startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LevelPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: changeNavigation,
      ),
      body: currentIndex == 1
          ? FavoritePage(
              favorites: daftarFavorit,
              onRemove: toggleFavorite,
            )
          : currentIndex == 2
              ? AccountPage(namaPengguna: widget.namaPengguna) // <-- Kirim nama ke Akun
              : _buildHomePage(),
    );
  }

  Widget _buildHomePage() {
    final kataKunci = searchController.text.toLowerCase().trim();

    final hasilPencarian = daftarInformasi.where((item) {
      final cocokKategori = kategoriAktif == 'Semua' || item.kategori == kategoriAktif;
      final cocokPencarian = item.judul.toLowerCase().contains(kataKunci) ||
          item.kategori.toLowerCase().contains(kataKunci) ||
          item.lokasi.toLowerCase().contains(kataKunci);
      return cocokKategori && cocokPencarian;
    }).toList();

    final sedangMencari = kataKunci.isNotEmpty;
    final sedangMemilihKategori = kategoriAktif != 'Semua';

    final daftarYangDitampilkan = (tampilkanSemua || sedangMencari || sedangMemilihKategori)
        ? hasilPencarian
        : hasilPencarian.take(3).toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 22),
            _searchField(),
            const SizedBox(height: 25),
            const Text(
              'Jelajahi Tuban',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppTheme.darkBlue),
            ),
            const SizedBox(height: 12),
            _kategoriGrid(),
            const SizedBox(height: 20),
            _gameBanner(),
            const SizedBox(height: 24),
            _judulInformasi(sedangMencari, sedangMemilihKategori),
            const SizedBox(height: 8),
            if (daftarYangDitampilkan.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Center(child: Text('Informasi tidak ditemukan.', style: TextStyle(color: Colors.grey))),
              )
            else
              ...daftarYangDitampilkan.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _informationCard(item),
                ),
              ),
            if (!tampilkanSemua && !sedangMencari && !sedangMemilihKategori && hasilPencarian.length > 3)
              Center(
                child: TextButton(
                  onPressed: bukaSemuaInformasi,
                  child: const Text('Lihat Semua Informasi'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(color: AppTheme.primaryBlue, borderRadius: BorderRadius.circular(16)),
          child: const Icon(Icons.landscape_rounded, color: Colors.white, size: 31),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TubanKu', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
            Text('Kenali Tuban lebih dekat', style: TextStyle(fontSize: 12, color: AppTheme.darkBlue)),
          ],
        ),
      ],
    );
  }

  Widget _searchField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Cari informasi Tuban...',
        prefixIcon: const Icon(Icons.search_rounded, color: AppTheme.darkBlue),
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  searchController.clear();
                  setState(() {
                    kategoriAktif = 'Semua';
                    tampilkanSemua = false;
                  });
                },
                icon: const Icon(Icons.close_rounded),
              )
            : null,
      ),
      onChanged: (_) {
        setState(() => kategoriAktif = 'Semua');
      },
    );
  }

  Widget _kategoriGrid() {
    final kategori = [
      {'nama': 'Sejarah', 'icon': Icons.account_balance_rounded, 'warna': const Color(0xFFDCEBFF), 'ikon': const Color(0xFF2878B8)},
      {'nama': 'Wisata', 'icon': Icons.park_rounded, 'warna': const Color(0xFFD8F1EF), 'ikon': const Color(0xFF4D9D79)},
      {'nama': 'Budaya', 'icon': Icons.theater_comedy_rounded, 'warna': const Color(0xFFE9DEFA), 'ikon': const Color(0xFF7653B8)},
      {'nama': 'Kuliner', 'icon': Icons.restaurant_rounded, 'warna': const Color(0xFFFFE9D7), 'ikon': const Color(0xFFE18A35)},
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2.25,
      children: kategori.map((item) {
        return _categoryCard(
          icon: item['icon'] as IconData,
          title: item['nama'] as String,
          background: item['warna'] as Color,
          iconColor: item['ikon'] as Color,
          onTap: () => pilihKategori(item['nama'] as String),
        );
      }).toList(),
    );
  }

  Widget _categoryCard({required IconData icon, required String title, required Color background, required Color iconColor, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(14)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.w600, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _gameBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF4AA5DC), Color(0xFF75C5E8)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppTheme.primaryBlue.withValues(alpha: 0.18), blurRadius: 12, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.22), shape: BoxShape.circle),
            child: const Icon(Icons.directions_run_rounded, size: 42, color: Colors.white),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('JELAJAH TUBAN', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Petualangan seru menjelajahi keindahan Tuban!', style: TextStyle(color: Colors.white, fontSize: 11, height: 1.4)),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: startGame,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Mulai Bermain', style: TextStyle(color: AppTheme.primaryBlue, fontWeight: FontWeight.bold, fontSize: 12)),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_rounded, size: 16, color: AppTheme.primaryBlue),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _judulInformasi(bool sedangMencari, bool sedangMemilihKategori) {
    return Row(
      children: [
        Expanded(
          child: Text(
            sedangMencari ? 'Hasil Pencarian' : sedangMemilihKategori ? 'Kategori $kategoriAktif' : tampilkanSemua ? 'Semua Informasi' : 'Informasi Pilihan',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkBlue),
          ),
        ),
        TextButton(
          onPressed: () {
            if (!sedangMencari && !sedangMemilihKategori && !tampilkanSemua) {
              bukaSemuaInformasi();
            } else {
              setState(() {
                kategoriAktif = 'Semua';
                tampilkanSemua = false;
                searchController.clear();
              });
            }
          },
          child: Text(
            (!sedangMencari && !sedangMemilihKategori && !tampilkanSemua) ? 'Lihat Semua' : 'Kembali',
            style: const TextStyle(color: AppTheme.primaryBlue, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _informationCard(Informasi item) {
    final favorit = isFavorite(item);

    return GestureDetector(
      onTap: () => bukaDetail(item),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD3EAF7)),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 3))],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
              child: InformasiImage(judul: item.judul, gambar: item.gambar, width: 95, height: 110, iconSize: 35),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.judul, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
                    const SizedBox(height: 6),
                    Text('${item.kategori} • ${item.lokasi}', style: const TextStyle(fontSize: 11, color: AppTheme.primaryBlue)),
                    const SizedBox(height: 8),
                    const Text('Ketuk untuk melihat detail', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            IconButton(
              tooltip: favorit ? 'Hapus dari Favorit' : 'Tambah ke Favorit',
              onPressed: () => toggleFavorite(item),
              icon: Icon(
                favorit ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: favorit ? const Color(0xFFE85D75) : AppTheme.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}