import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game_player.dart';

class JelajahGame extends FlameGame with ChangeNotifier {
  JelajahGame({required this.levelId});

  final int levelId;

  late GamePlayer pemain;

  int jumlahKoin = 0;
  int skor = 0;
  bool selesai = false;

  late RectangleComponent tanahUtama;
  late RectangleComponent lapisanTanah;
  final List<RectangleComponent> daftarPlatform = [];
  final List<KoinGame> daftarKoin = [];
  final List<Component> daftarDekorasi = [];
  final List<AwanDekorasi> daftarAwan = [];
  late RectangleComponent garisFinish;

  final List<Rect> posisiAwalPlatform = [
    const Rect.fromLTWH(220, 400, 140, 22),
    const Rect.fromLTWH(420, 340, 140, 22),
    const Rect.fromLTWH(650, 390, 140, 22),
    const Rect.fromLTWH(880, 320, 140, 22),
    const Rect.fromLTWH(1120, 380, 140, 22),
    const Rect.fromLTWH(1380, 330, 140, 22),
    const Rect.fromLTWH(1620, 390, 140, 22),
  ];

  final List<Vector2> posisiKoin = [
    Vector2(260, 360),
    Vector2(460, 300),
    Vector2(690, 350),
    Vector2(920, 280),
    Vector2(1160, 340),
    Vector2(1420, 290),
    Vector2(1660, 350),
  ];

  final List<double> posisiDekorasiX = [80, 380, 680, 980, 1280, 1580, 1850];

  @override
  Color backgroundColor() {
    switch (levelId) {
      case 1:
        return const Color(0xFF81D4FA); // Sejarah: Alam Pemandangan Cerah
      case 2:
        return const Color(0xFF4FC3F7); // Wisata: Langit Pantai
      case 3:
        return const Color(0xFF3F51B5); // Budaya: Langit Malam Panggung Wayang
      case 4:
        return const Color(0xFFFFCC80); // Kuliner: Warm Peach
      default:
        return const Color(0xFF81D4FA);
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Color warnaAtasTanah = const Color(0xFF4CAF50);
    Color warnaBawahTanah = const Color(0xFF388E3C);

    if (levelId == 1) { // Alam Perbukitan
      warnaAtasTanah = const Color(0xFF43A047);
      warnaBawahTanah = const Color(0xFF2E7D32);
    } else if (levelId == 2) { // Wisata Pantai
      warnaAtasTanah = const Color(0xFF66BB6A);
      warnaBawahTanah = const Color(0xFFFFB300);
    } else if (levelId == 3) { // Budaya Panggung
      warnaAtasTanah = const Color(0xFF8D6E63);
      warnaBawahTanah = const Color(0xFF4E342E);
    } else if (levelId == 4) { // Kuliner
      warnaAtasTanah = const Color(0xFFFF7043);
      warnaBawahTanah = const Color(0xFFE64A19);
    }

    // 1. TAMBAH AWAN DI LANGIT
    final List<Vector2> posisiAwan = [
      Vector2(60, 60), Vector2(350, 90), Vector2(700, 50),
      Vector2(1050, 80), Vector2(1400, 60), Vector2(1750, 100),
    ];
    for (final pos in posisiAwan) {
      final awan = AwanDekorasi(position: pos);
      daftarAwan.add(awan);
      add(awan);
    }

    // 2. TAMBAH DEKORASI UTAMA TIAP LEVEL
    for (final posX in posisiDekorasiX) {
      Component deko;
      if (levelId == 1) {
        deko = DekorasiAlamPerbukitan(position: Vector2(posX, 500));
      } else if (levelId == 2) {
        deko = DekorasiPohonKelapaBagus(position: Vector2(posX, 500));
      } else if (levelId == 3) {
        deko = DekorasiWayangBudaya(position: Vector2(posX, 500));
      } else {
        deko = DekorasiKedaiKulinerBagus(position: Vector2(posX, 500));
      }
      daftarDekorasi.add(deko);
      add(deko);
    }

    // 3. TANAH UTAMA
    tanahUtama = RectangleComponent(
      position: Vector2(0, 500),
      size: Vector2(2400, 150),
      paint: Paint()..color = warnaAtasTanah,
    );
    add(tanahUtama);

    lapisanTanah = RectangleComponent(
      position: Vector2(0, 525),
      size: Vector2(2400, 125),
      paint: Paint()..color = warnaBawahTanah,
    );
    add(lapisanTanah);

    // 4. PLATFORM
    for (final posisi in posisiAwalPlatform) {
      final plat = RectangleComponent(
        position: Vector2(posisi.left, posisi.top),
        size: Vector2(posisi.width, posisi.height),
        paint: Paint()..color = warnaAtasTanah,
      );
      daftarPlatform.add(plat);
      add(plat);
    }

    // 5. PEMAIN
    pemain = GamePlayer(position: Vector2(150, 490));
    add(pemain);

    // 6. KOIN GAME
    for (final posisi in posisiKoin) {
      final koin = KoinGame(
        posisiKoin: posisi,
        pemain: pemain,
        saatDiambil: () {
          jumlahKoin++;
          skor += 100;
          notifyListeners();
        },
      );
      daftarKoin.add(koin);
      add(koin);
    }

    // 7. GARIS FINISH
    garisFinish = RectangleComponent(
      position: Vector2(1900, 380),
      size: Vector2(12, 120),
      paint: Paint()..color = Colors.amber,
    );
    add(garisFinish);
  }

  List<Rect> getPosisiPlatformSaatIni() {
    List<Rect> posisiSekarang = [];
    for (int i = 0; i < daftarPlatform.length; i++) {
      var plat = daftarPlatform[i];
      posisiSekarang.add(Rect.fromLTWH(
        plat.position.x,
        plat.position.y,
        posisiAwalPlatform[i].width,
        posisiAwalPlatform[i].height,
      ));
    }
    return posisiSekarang;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isLoaded) {
      if (pemain.kecepatanX != 0) {
        final double geser = pemain.kecepatanX * dt;

        tanahUtama.position.x -= geser;
        lapisanTanah.position.x -= geser;
        garisFinish.position.x -= geser;

        for (var plat in daftarPlatform) {
          plat.position.x -= geser;
        }
        for (var koin in daftarKoin) {
          koin.position.x -= geser;
        }
        for (var deko in daftarDekorasi) {
          (deko as PositionComponent).position.x -= geser;
        }
        for (var awan in daftarAwan) {
          awan.position.x -= geser * 0.35;
        }
      }

      if (garisFinish.position.x <= 150 && !selesai) {
        selesai = true;
        pemain.berhenti();
        notifyListeners();
      }
    }
  }

  void gerakKiri() { if (!selesai) pemain.gerakKiri(); }
  void gerakKanan() { if (!selesai) pemain.gerakKanan(); }
  void berhenti() { pemain.berhenti(); }
  void lompat() { if (!selesai) pemain.lompat(); }
}

// =============================================================
// DEKORASI AWAN
// =============================================================
class AwanDekorasi extends PositionComponent {
  AwanDekorasi({required Vector2 position})
      : super(position: position, size: Vector2(100, 50));

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paintAwan = Paint()..color = Colors.white.withValues(alpha: 0.85);

    canvas.drawCircle(const Offset(30, 30), 20, paintAwan);
    canvas.drawCircle(const Offset(50, 20), 25, paintAwan);
    canvas.drawCircle(const Offset(70, 30), 20, paintAwan);
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(20, 25, 60, 20), const Radius.circular(10)),
      paintAwan,
    );
  }
}

// =============================================================
// LEVEL 1: PEMANDANGAN ALAM & PERBUKITAN HISTORIS
// =============================================================
class DekorasiAlamPerbukitan extends PositionComponent {
  DekorasiAlamPerbukitan({required Vector2 position})
      : super(position: position, size: Vector2(110, 130), anchor: Anchor.bottomCenter);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paintBukit = Paint()..color = const Color(0xFF66BB6A);
    final paintPohon = Paint()..color = const Color(0xFF2E7D32);
    final paintBatang = Paint()..color = const Color(0xFF5D4037);

    // Gunung / Bukit di Belakang
    Path bukit = Path()
      ..moveTo(0, 130)
      ..lineTo(55, 30)
      ..lineTo(110, 130)
      ..close();
    canvas.drawPath(bukit, paintBukit);

    // Pohon-Pohon Alam Sejarah
    canvas.drawRect(const Rect.fromLTWH(20, 70, 10, 60), paintBatang);
    canvas.drawCircle(const Offset(25, 65), 22, paintPohon);

    canvas.drawRect(const Rect.fromLTWH(80, 80, 8, 50), paintBatang);
    canvas.drawCircle(const Offset(84, 75), 18, paintPohon);
  }
}

// =============================================================
// LEVEL 2: POHON KELAPA & PANTAI WISATA
// =============================================================
class DekorasiPohonKelapaBagus extends PositionComponent {
  DekorasiPohonKelapaBagus({required Vector2 position})
      : super(position: position, size: Vector2(100, 130), anchor: Anchor.bottomCenter);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paintBatang = Paint()..color = const Color(0xFF6D4C41);
    final paintDaun = Paint()..color = const Color(0xFF2E7D32);
    final paintKelapa = Paint()..color = const Color(0xFF795548);
    final paintSemak = Paint()..color = const Color(0xFF81C784);

    Path batang = Path()
      ..moveTo(42, 130)
      ..quadraticBezierTo(55, 70, 48, 35)
      ..lineTo(58, 35)
      ..quadraticBezierTo(65, 70, 52, 130)
      ..close();
    canvas.drawPath(batang, paintBatang);

    canvas.drawCircle(const Offset(45, 38), 6, paintKelapa);
    canvas.drawCircle(const Offset(55, 38), 6, paintKelapa);

    canvas.drawCircle(const Offset(22, 25), 24, paintDaun);
    canvas.drawCircle(const Offset(78, 25), 24, paintDaun);
    canvas.drawCircle(const Offset(50, 15), 26, paintDaun);

    canvas.drawCircle(const Offset(25, 125), 15, paintSemak);
    canvas.drawCircle(const Offset(75, 125), 15, paintSemak);
  }
}

// =============================================================
// LEVEL 3: WAYANG KULIT & PANGGUNG SENI BUDAYA
// =============================================================
class DekorasiWayangBudaya extends PositionComponent {
  DekorasiWayangBudaya({required Vector2 position})
      : super(position: position, size: Vector2(100, 140), anchor: Anchor.bottomCenter);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paintEmas = Paint()..color = const Color(0xFFFFD54F);
    final paintCokelat = Paint()..color = const Color(0xFF5D4037);
    final paintLampu = Paint()..color = const Color(0xFFFFEB3B);

    // Panggung Kayu Ukir
    canvas.drawRect(const Rect.fromLTWH(10, 110, 80, 30), paintCokelat);

    // Gunungan Wayang Kulit Khas Tuban/Jawa
    Path wayang = Path()
      ..moveTo(50, 10)
      ..lineTo(80, 80)
      ..lineTo(70, 110)
      ..lineTo(30, 110)
      ..lineTo(20, 80)
      ..close();
    canvas.drawPath(wayang, paintEmas);

    // Tangkai / Gagang Wayang
    canvas.drawRect(const Rect.fromLTWH(48, 80, 4, 40), paintCokelat);

    // Lampu Panggung Kebudayaan
    canvas.drawCircle(const Offset(15, 30), 8, paintLampu);
    canvas.drawCircle(const Offset(85, 30), 8, paintLampu);
  }
}

// =============================================================
// LEVEL 4: KEDAI KULINER
// =============================================================
class DekorasiKedaiKulinerBagus extends PositionComponent {
  DekorasiKedaiKulinerBagus({required Vector2 position})
      : super(position: position, size: Vector2(100, 110), anchor: Anchor.bottomCenter);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paintKayu = Paint()..color = const Color(0xFFA1887F);
    final paintAtap1 = Paint()..color = const Color(0xFFE53935);
    final paintAtap2 = Paint()..color = Colors.white;
    final paintSpanduk = Paint()..color = const Color(0xFFFFB74D);

    for (int i = 0; i < 6; i++) {
      canvas.drawRect(
        Rect.fromLTWH(10 + (i * 13.3), 15, 13.3, 22),
        i % 2 == 0 ? paintAtap1 : paintAtap2,
      );
    }

    canvas.drawRect(const Rect.fromLTWH(15, 37, 70, 73), paintKayu);

    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(20, 55, 60, 25), const Radius.circular(4)),
      paintSpanduk,
    );
  }
}

// =============================================================
// KOIN GAME
// =============================================================
class KoinGame extends CircleComponent {
  KoinGame({
    required Vector2 posisiKoin,
    required this.pemain,
    required this.saatDiambil,
  }) : super(
          position: posisiKoin,
          radius: 12,
          paint: Paint()..color = const Color(0xFFFFC928),
        );

  final GamePlayer pemain;
  final VoidCallback saatDiambil;
  bool sudahDiambil = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (sudahDiambil) return;

    final posisiTengahKoin = position + Vector2(12, 12);
    final posisiPemain = pemain.position - Vector2(0, 30);
    final jarak = (posisiPemain - posisiTengahKoin).length;

    if (jarak < 35) {
      sudahDiambil = true;
      saatDiambil();
      removeFromParent();
    }
  }
}