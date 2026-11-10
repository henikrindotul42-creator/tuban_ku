
import 'package:flutter/material.dart';

import '../models/informasi.dart';
import '../theme/app_theme.dart';
import '../widgets/informasi_image.dart';
import 'detail_page.dart';

class AllInformationPage extends StatefulWidget {
  final List<Informasi> informasi;
  final bool Function(Informasi) isFavorite;
  final ValueChanged<Informasi> onFavorite;

  const AllInformationPage({
    super.key,
    required this.informasi,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  State<AllInformationPage> createState() =>
      _AllInformationPageState();
}

class _AllInformationPageState extends State<AllInformationPage> {
  String kataKunci = '';
  String kategoriAktif = 'Semua';

  @override
  Widget build(BuildContext context) {
    final daftarTampil = widget.informasi.where((item) {
      final cocokKategori = kategoriAktif == 'Semua' ||
          item.kategori == kategoriAktif;

      final cocokPencarian =
          item.judul.toLowerCase().contains(kataKunci.toLowerCase()) ||
          item.lokasi.toLowerCase().contains(kataKunci.toLowerCase()) ||
          item.kategori.toLowerCase().contains(kataKunci.toLowerCase());

      return cocokKategori && cocokPencarian;
    }).toList();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Semua Informasi Tuban'),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari informasi Tuban...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  kataKunci = value;
                });
              },
            ),
          ),

          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                'Semua',
                'Sejarah',
                'Wisata',
                'Budaya',
                'Kuliner',
              ].map((kategori) {
                final aktif = kategoriAktif == kategori;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(kategori),
                    selected: aktif,
                    onSelected: (_) {
                      setState(() {
                        kategoriAktif = kategori;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: daftarTampil.isEmpty
                ? const Center(
                    child: Text('Informasi tidak ditemukan.'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: daftarTampil.length,
                    itemBuilder: (context, index) {
                      final item = daftarTampil[index];
                      final favorit = widget.isFavorite(item);

                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),

                          // FOTO INFORMASI
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: InformasiImage(
                              judul: item.judul,
                              gambar: item.gambar,
                              width: 55,
                              height: 55,
                              iconSize: 22,
                            ),
                          ),

                          title: Text(
                            item.judul,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkBlue,
                            ),
                          ),

                          subtitle: Text(
                            '${item.kategori} • ${item.lokasi}',
                          ),

                          trailing: IconButton(
                            tooltip: favorit
                                ? 'Hapus dari Favorit'
                                : 'Tambah ke Favorit',
                            onPressed: () {
                              widget.onFavorite(item);
                              setState(() {});
                            },
                            icon: Icon(
                              favorit
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: favorit
                                  ? Colors.pink
                                  : AppTheme.primaryBlue,
                            ),
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailPage(
                                  informasi: item,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
