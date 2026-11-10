import 'package:flutter/material.dart';

class InformasiImage extends StatelessWidget {
  final String judul;
  final String gambar;
  final double height;
  final double? width;
  final double iconSize;
  final BoxFit fit;

  const InformasiImage({
    super.key,
    required this.judul,
    required this.gambar,
    this.height = 200,
    this.width,
    this.iconSize = 45,
    this.fit = BoxFit.cover,
  });

  Widget gambarPengganti() {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFDDEEFF),
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported_outlined,
        size: iconSize,
        color: const Color(0xFF4A90E2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pathGambar = gambar.trim();

    if (pathGambar.isEmpty) {
      return gambarPengganti();
    }

    // PERBAIKAN: Jangan gunakan double.infinity di dalam properti width/height Image
    // Kita gunakan Container/SizedBox untuk membungkusnya agar aman.
    
    Widget imageWidget;

    if (pathGambar.startsWith('http://') || pathGambar.startsWith('https://')) {
      imageWidget = Image.network(
        pathGambar,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: width,
            height: height,
            color: const Color(0xFFDDEEFF),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              color: Color(0xFF4A90E2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return gambarPengganti();
        },
      );
    } else {
      imageWidget = Image.asset(
        pathGambar,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return gambarPengganti();
        },
      );
    }

    // Membungkus gambar dengan SizedBox agar ukurannya jelas dan tidak Infinity
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Opsional: bikin sudut agak melengkung
        child: imageWidget,
      ),
    );
  }
}