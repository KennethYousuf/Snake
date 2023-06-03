import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:snake_game/blankpixel.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //grid dimensions
  int rowSize = 10;
  int totalSquares = 100;
  // snake position
  List<int> snakePos = [0, 1, 2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: totalSquares,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rowSize),
                  itemBuilder: ((context, index) {
                    return const Blankpixel();
                  }))),
        ],
      ),
    );
  }
}
