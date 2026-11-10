import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFD7EAF5),
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item(
              icon: Icons.home_rounded,
              label: 'Beranda',
              index: 0,
            ),
            _item(
              icon: Icons.favorite_border_rounded,
              label: 'Favorit',
              index: 1,
            ),
            _item(
              icon: Icons.person_outline_rounded,
              label: 'Akun',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool active = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 25,
              color: active
                  ? AppTheme.primaryBlue
                  : AppTheme.darkBlue.withValues(alpha:0.55),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight:
                    active ? FontWeight.bold : FontWeight.normal,
                color: active
                    ? AppTheme.primaryBlue
                    : AppTheme.darkBlue.withValues(alpha:0.65),
              ),
            ),
          ],
        ),
      ),
    );
  }
}