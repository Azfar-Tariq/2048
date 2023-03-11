import 'package:flutter/material.dart';
import 'package:game_2048/colors.dart';
import 'package:game_2048/tile.dart';

void main() {
  runApp(const Game2048());
}

class Game2048 extends StatelessWidget {
  const Game2048({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '2048',
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  // 2d array
  List<List<Tile>> grid =
      List.generate(4, (y) => List.generate(4, (x) => Tile(x, y, 0)));
  Iterable<Tile> get flattenedGrid => grid.expand((e) => e);
  @override
  Widget build(BuildContext context) {
    double gridSize = MediaQuery.of(context).size.width - 16.0 * 2;
    double tileSize = (gridSize - 4.0 * 2) / 4;
    List<Widget> stackItems = [];
    // add empty space
    stackItems.addAll(
      flattenedGrid.map(
        (e) => Positioned(
          left: e.x * tileSize,
          top: e.x * tileSize,
          width: tileSize,
          height: tileSize,
          child: Center(
            child: Container(
              width: tileSize - 4.0 * 2,
              height: tileSize - 4.0 * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: lightBrown,
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: tan,
      body: Center(
        child: Container(
          width: gridSize,
          height: gridSize,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: darkBrown,
          ),
          child: Stack(
            children: stackItems,
          ),
        ),
      ),
    );
  }
}
