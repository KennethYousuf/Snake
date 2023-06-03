
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class Blankpixel extends StatelessWidget {
  const Blankpixel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                        
                      ),
                    );
  }
}