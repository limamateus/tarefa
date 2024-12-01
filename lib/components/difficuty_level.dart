import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int  difficutyLevel;

  const Difficulty({
    super.key,
    required this.difficutyLevel,

  });



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: (difficutyLevel > 1)
              ? Colors.blue
              : Colors.blue[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (difficutyLevel > 2)
              ? Colors.blue
              : Colors.blue[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (difficutyLevel > 3)
              ? Colors.blue
              : Colors.blue[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (difficutyLevel > 4)
              ? Colors.blue
              : Colors.blue[100],
          size: 20,
        ),
        Icon(
          Icons.star,
          color: (difficutyLevel > 5
              ? Colors.blue
              : Colors.blue[100]),
          size: 20,
        )
      ],
    );
  }
}