import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GamePlayer extends SpriteComponent with HasGameReference<FlameGame> {
  GamePlayer({required Vector2 position})
      : super(
          position: position,
          size: Vector2(55, 65), // Ukuran karakter disesuaikan
          anchor: Anchor.bottomCenter,
        );

  double kecepatanX = 0;
  double kecepatanY = 0;
  final double kecepatanNormal = 180;
  final double kekuatanLompat = 450;
  final double gravitasi = 950;

  bool diTanah = true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    try {
      sprite = await Sprite.load('karakter.png');
    } catch (e) {
      debugPrint('Aset gambar karakter belum ditemukan: $e');
    }
  }

  void gerakKiri() => kecepatanX = -kecepatanNormal;
  void gerakKanan() => kecepatanX = kecepatanNormal;
  void berhenti() => kecepatanX = 0;

  void lompat() {
    if (diTanah) {
      kecepatanY = -kekuatanLompat;
      diTanah = false;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x = 150; // Kunci posisi X karakter di tengah layar

    final double posisiKakiSebelum = position.y;

    kecepatanY += gravitasi * dt;
    position.y += kecepatanY * dt;
    diTanah = false;

    final game = this.game as dynamic;

    if (kecepatanY >= 0) {
      for (final p in game.getPosisiPlatformSaatIni()) {
        bool diAtasPlatform = 150 >= p.left && 150 <= p.right;
        bool melewatiPermukaan = posisiKakiSebelum <= p.top + 5 && position.y >= p.top;

        if (diAtasPlatform && melewatiPermukaan) {
          position.y = p.top;
          kecepatanY = 0;
          diTanah = true;
          break;
        }
      }
    }

    if (position.y >= 500) {
      position.y = 500;
      kecepatanY = 0;
      diTanah = true;
    }
  }
}