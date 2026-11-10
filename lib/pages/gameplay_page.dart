import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../game/game_controls.dart';
import '../game/jelajah_game.dart';
import 'level_result_page.dart';

class GameplayPage extends StatefulWidget {
  final int? levelId;

  const GameplayPage({super.key, this.levelId});

  @override
  State<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  late JelajahGame _game;

  @override
  void initState() {
    super.initState();
    _game = JelajahGame(levelId: widget.levelId ?? 1);

    _game.addListener(() {
      if (_game.selesai && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LevelResultPage(
              levelId: widget.levelId ?? 1,
              skor: _game.skor,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (FocusNode node, KeyEvent event) {
        final isDown = event is KeyDownEvent;
        final isUp = event is KeyUpEvent;

        if (isDown || isUp) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
              event.logicalKey == LogicalKeyboardKey.keyA) {
            if (isDown) {
              _game.gerakKiri();
            } else {
              _game.berhenti();
            }
            return KeyEventResult.handled;
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
              event.logicalKey == LogicalKeyboardKey.keyD) {
            if (isDown) {
              _game.gerakKanan();
            } else {
              _game.berhenti();
            }
            return KeyEventResult.handled;
          } else if (isDown &&
              (event.logicalKey == LogicalKeyboardKey.arrowUp ||
                  event.logicalKey == LogicalKeyboardKey.keyW ||
                  event.logicalKey == LogicalKeyboardKey.space)) {
            _game.lompat();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // 1. Game Canvas (Flame Engine)
              GameWidget(game: _game),

              // 2. Top Bar Display (Score & Stat)
              Positioned(
                top: 10,
                left: 16,
                right: 16,
                child: ListenableBuilder(
                  listenable: _game,
                  builder: (context, _) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.monetization_on, color: Colors.amber),
                              Text(
                                " ${_game.jumlahKoin}",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(width: 20),
                              const Icon(Icons.star, color: Colors.orange),
                              Text(
                                " ${_game.skor}",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 3. Tombol Controls On-Screen
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GameControls(
                  onKiri: () => _game.gerakKiri(),
                  onKanan: () => _game.gerakKanan(),
                  onBerhenti: () => _game.berhenti(),
                  onLompat: () => _game.lompat(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}