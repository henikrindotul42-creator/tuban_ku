import 'package:flutter/material.dart';

import '../models/informasi.dart';
import '../widgets/informasi_image.dart';

class DetailPage extends StatelessWidget {
  final Informasi informasi;

  const DetailPage({
    super.key,
    required this.informasi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: const Text(
          'Detail Informasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FOTO INFORMASI
            SizedBox(
              width: double.infinity,
              height: 280, // Kunci tinggi gambar agar tidak Infinity
              child: InformasiImage(
                judul: informasi.judul,
                gambar: informasi.gambar,
                width: double.infinity,
                height: 280,
                iconSize: 60,
                fit: BoxFit.cover, // Gunakan cover agar tidak gepeng
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    informasi.judul,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF234B76),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEBFA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      informasi.kategori,
                      style: const TextStyle(
                        color: Color(0xFF357ABD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF4A90E2),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          informasi.lokasi,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Informasi',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF234B76),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    informasi.deskripsi,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.7,
                      color: Colors.black87,
                    ),
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