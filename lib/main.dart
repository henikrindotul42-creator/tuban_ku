import 'package:flutter/material.dart';

import 'pages/splash_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const TubanKuApp());
}

class TubanKuApp extends StatelessWidget {
  const TubanKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TubanKu',
      theme: AppTheme.theme,
      home: const SplashPage(),
    );
  }
}
