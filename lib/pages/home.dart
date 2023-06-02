import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            IconButton(
              alignment: Alignment.bottomCenter,
              onPressed: (){}, icon: Icon(Icons.play_circle_fill_rounded,size:  80.0,color: Color.fromARGB(255, 67, 129, 69),))
          ],
        ),
      ),
      
    );
  }
}