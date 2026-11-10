import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';
import '../theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _logoAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _textAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.35,
        1.0,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF123E78),
              Color(0xFF1E6091),
              Color(0xFF3F95D0),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Pola lingkaran bagian atas
            Positioned(
              top: -35,
              left: -25,
              child: _circlePattern(
                size: 170,
                opacity: 0.10,
              ),
            ),

            Positioned(
              top: 80,
              right: -55,
              child: _circlePattern(
                size: 180,
                opacity: 0.08,
              ),
            ),

            // Pola lingkaran bagian bawah
            Positioned(
              bottom: -45,
              left: -50,
              child: _circlePattern(
                size: 190,
                opacity: 0.08,
              ),
            ),

            Positioned(
              bottom: 90,
              right: -45,
              child: _circlePattern(
                size: 150,
                opacity: 0.08,
              ),
            ),

            // Dekorasi awan
            Positioned(
              top: 150,
              left: -45,
              child: _cloud(
                width: 120,
                height: 42,
              ),
            ),

            Positioned(
              top: 205,
              right: -45,
              child: _cloud(
                width: 135,
                height: 48,
              ),
            ),

            Positioned(
              bottom: 170,
              left: -50,
              child: _cloud(
                width: 145,
                height: 50,
              ),
            ),

            // Isi utama
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  ScaleTransition(
                    scale: _logoAnimation,
                    child: Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha:0.18),
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              color: AppTheme.lightBlue,
                              borderRadius:
                                  BorderRadius.circular(28),
                            ),
                          ),

                          const Icon(
                            Icons.landscape_rounded,
                            color: AppTheme.primaryBlue,
                            size: 65,
                          ),

                          Positioned(
                            right: 19,
                            top: 19,
                            child: Container(
                              width: 19,
                              height: 19,
                              decoration: const BoxDecoration(
                                color: AppTheme.yellow,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.star_rounded,
                                size: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Nama aplikasi
                  FadeTransition(
                    opacity: _textAnimation,
                    child: const Text(
                      'TubanKu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  FadeTransition(
                    opacity: _textAnimation,
                    child: const Text(
                      'Kenali Tuban lebih dekat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  FadeTransition(
                    opacity: _textAnimation,
                    child: Container(
                      width: 55,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha:0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tulisan bawah
            Positioned(
              bottom: 35,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _textAnimation,
                child: const Text(
                  'Jelajahi • Kenali • Cintai Tuban',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cloud({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.10),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget _circlePattern({
    required double size,
    required double opacity,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: CirclePatternPainter(
          opacity: opacity,
        ),
      ),
    );
  }
}

class CirclePatternPainter extends CustomPainter {
  final double opacity;

  CirclePatternPainter({
    required this.opacity,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha:opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    const double spacing = 38;

    for (double y = 0; y < size.height + spacing; y += spacing) {
      for (double x = 0; x < size.width + spacing; x += spacing) {
        canvas.drawCircle(
          Offset(x, y),
          18,
          paint,
        );

        canvas.drawCircle(
          Offset(x + 18, y),
          18,
          paint,
        );

        canvas.drawCircle(
          Offset(x + 9, y + 16),
          18,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}