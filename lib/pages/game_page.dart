import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_game/blankpixel.dart';
import 'package:snake_game/foodpixel.dart';
import 'package:snake_game/snakepixel.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

enum snake_directions { UP, DOWN, RIGHT, LEFT }

class _GamePageState extends State<GamePage> {
  //grid dimensions
  int rowSize = 20;
  int totalSquares = 600;
  // snake position
  List<int> snakePos = [0, 1, 2];
  //initial snake direction
  var currentDirection = snake_directions.RIGHT;
  // food
  int foodPos = 45;
  //start game
  void startGame() {
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      setState(() {
        moveSnake(); //snake moving
        if (gameover == true) {
          timer.cancel();
        }
      });
    });
  }

  void moveSnake() {
    switch (currentDirection) {
      case snake_directions.RIGHT:
        {
          int newHead = snakePos.last + 1; // calculate new head position
          if (newHead % rowSize == 0) {
            // check if the new head is at the right edge
            newHead -= rowSize; // wrap around to the next row
          }
          if (snakePos.contains(newHead) || newHead >= totalSquares) {
            // check if the new head collides with the snake itself or goes out of bounds
            // game over logic

            return gameover();
          }
          snakePos.add(newHead); // add a head
          if (newHead == foodPos) {
            // check if the new head overlaps with the food
            // snake eats the food
            foodPos = generateNewFoodPos();
          } else {
            snakePos.removeAt(0); // remove tail
          }
        }
        break;
      case snake_directions.LEFT:
        {
          int newHead = snakePos.last - 1; // calculate new head position
          if ((newHead + 1) % rowSize == 0) {
            // check if the new head is at the left edge
            newHead += rowSize; // wrap around to the previous row
          }
          if (snakePos.contains(newHead) || newHead < 0) {
            // check if the new head collides with the snake itself or goes out of bounds
            // game over logic

            return gameover();
          }
          snakePos.add(newHead); // add a head
          if (newHead == foodPos) {
            // check if the new head overlaps with the food
            // snake eats the food
            foodPos = generateNewFoodPos();
          } else {
            snakePos.removeAt(0); // remove tail
          }
        }
        break;
      case snake_directions.UP:
        {
          int newHead = snakePos.last - rowSize; // calculate new head position
          if (newHead < 0) {
            // check if the new head is at the top edge
            newHead += totalSquares; // wrap around to the bottom row
          }
          if (snakePos.contains(newHead)) {
            // check if the new head collides with the snake itself
            // game over logic

            return gameover();
          }
          snakePos.add(newHead); // add a head
          if (newHead == foodPos) {
            // check if the new head overlaps with the food
            // snake eats the food
            foodPos = generateNewFoodPos();
          } else {
            snakePos.removeAt(0); // remove tail
          }
        }
        break;
      case snake_directions.DOWN:
        {
          int newHead = snakePos.last + rowSize; // calculate new head position
          if (newHead >= totalSquares) {
            // check if the new head is at the bottom edge
            newHead -= totalSquares; // wrap around to the top row
          }
          if (snakePos.contains(newHead)) {
            // check if the new head collides with the snake itself
            // game over logic

            return gameover();
          }
          snakePos.add(newHead); // add a head
          if (newHead == foodPos) {
            // check if the new head overlaps with the food
            // snake eats the food
            foodPos = generateNewFoodPos();
          } else {
            snakePos.removeAt(0); // remove tail
          }
        }
        break;
      default:
    }
  }

// Generate a new random position for the food
  int generateNewFoodPos() {
    final random = Random();
    int newFoodPos;
     // Calculate the valid range of positions
  int minPos = 0;
  int maxPos = totalSquares - 1;
    do {
      newFoodPos = random.nextInt(totalSquares);
    } while (snakePos.contains(newFoodPos));
    return newFoodPos;
  }

   gameover() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Game Over"),
                  actions: [
          TextButton(
            child: const Text('Restart'),
            onPressed: () {
              // Reset the game state and restart the game
              resetGame();
              Navigator.pop(context);
              startGame();
            },
          ),
        ],

          );
        });
  }
void resetGame() {
  snakePos = [0, 1, 2]; // Reset snake position
  currentDirection = snake_directions.RIGHT; // Reset snake direction
  foodPos = generateNewFoodPos(); // Generate new food position
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container(
            

          )),
          Expanded(
              flex: 4,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 0) {
                    currentDirection = snake_directions.DOWN;
                  } else if (details.delta.dy < 0) {
                    currentDirection = snake_directions.UP;
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 0) {
                    currentDirection = snake_directions.RIGHT;
                  } else if (details.delta.dx < 0) {
                    currentDirection = snake_directions.LEFT;
                  }
                },
                child: GridView.builder(
                    itemCount: totalSquares,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rowSize),
                    itemBuilder: ((context, index) {
                      if (snakePos.contains(index)) {
                        return const SnakePixel();
                      } else if (foodPos == index) {
                        return const FoodPixel();
                      } else {
                        return const Blankpixel();
                      }
                    })),
              )),
          Expanded(
              child: Container(
            child: Center(
              child: MaterialButton(
                child: Text('PLAY'),
                color: Colors.amber,
                onPressed: () {
                  startGame();
                },
              ),
            ),
          ))
        ],
      ),
    );
  }
}
