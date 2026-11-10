import 'package:flutter/material.dart';

import '../models/informasi.dart';
import '../widgets/informasi_image.dart'; // <-- Tambahkan import ini
import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  final List<Informasi> favorites;
  final ValueChanged<Informasi> onRemove;

  const FavoritePage({
    super.key,
    required this.favorites,
    required this.onRemove,
  });

  static const Color biruUtama = Color(0xFF4A90E2);
  static const Color biruTeks = Color(0xFF234B76);
  static const Color latar = Color(0xFFF5F9FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: latar,
      appBar: AppBar(
        title: const Text(
          'Favorit Saya',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: biruUtama,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: favorites.isEmpty
          ? _buildEmpty()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = favorites[index];

                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  elevation: 1,
                  shadowColor: biruUtama.withValues(alpha:0.12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: Color(0xFFDCEBFA),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            informasi: item,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        // BAGIAN GAMBAR YANG SUDAH DIPERBAIKI
                        SizedBox(
                          width: 105,
                          height: 105,
                          child: InformasiImage(
                            judul: item.judul,
                            gambar: item.gambar,
                            width: 105,
                            height: 105,
                            iconSize: 32,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.judul,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: biruTeks,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 9,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F2FF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    item.kategori,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: biruUtama,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: Text(
                                        item.lokasi,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: IconButton(
                            tooltip: 'Hapus dari Favorit',
                            onPressed: () => onRemove(item),
                            icon: const Icon(
                              Icons.favorite,
                              color: Color(0xFFE85D75),
                              size: 23,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_border,
              size: 72,
              color: Color(0xFF8BB8E8),
            ),
            const SizedBox(height: 16),
            const Text(
              'Belum Ada Favorit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: biruTeks,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Simpan informasi Tuban yang kamu sukai '
              'agar mudah ditemukan kembali.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}