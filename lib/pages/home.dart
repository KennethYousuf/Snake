import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snake_game/pages/game_page.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/snake.png'),
            SizedBox(
              height: 65,
            ),
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                  
                     borderRadius: BorderRadius.circular(18.0),
                  ),
                  
                    textStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                icon: Icon(
                  Icons.play_arrow_sharp,
                  color: Color.fromARGB(255, 70, 119, 71),
                  size: 85,
                ),
                label: Text(
                  "Let's Play",
                style: TextStyle(
                  color: Color.fromARGB(255, 70, 119, 71),
                ),))
          ],
        ),
      ),
    );
  }
}
