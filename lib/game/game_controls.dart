import 'package:flutter/material.dart';

class GameControls extends StatelessWidget {
  final VoidCallback onKiri;
  final VoidCallback onKanan;
  final VoidCallback onBerhenti;
  final VoidCallback onLompat;

  const GameControls({
    super.key,
    required this.onKiri,
    required this.onKanan,
    required this.onBerhenti,
    required this.onLompat,
  });

  Widget tombol({
    required IconData ikon,
    required VoidCallback saatDitekan,
    VoidCallback? saatDilepas,
  }) {
    return Listener(
      onPointerDown: (_) => saatDitekan(),
      onPointerUp: (_) => saatDilepas?.call(),
      onPointerCancel: (_) => saatDilepas?.call(),
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          color: const Color(0xFF2789C9).withValues(alpha: 0.9),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(ikon, size: 34, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              tombol(
                ikon: Icons.arrow_back_rounded,
                saatDitekan: onKiri,
                saatDilepas: onBerhenti,
              ),
              const SizedBox(width: 14),
              tombol(
                ikon: Icons.arrow_forward_rounded,
                saatDitekan: onKanan,
                saatDilepas: onBerhenti,
              ),
            ],
          ),
          tombol(
            ikon: Icons.arrow_upward_rounded,
            saatDitekan: onLompat,
          ),
        ],
      ),
    );
  }
}