import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/food_details/counter_button.dart';

class CounterWidget extends StatefulWidget {
  CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

@override
class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    counter = 1;
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CounterButton(op: "+", counterPress: incrementCounter),
        SizedBox(width: 20),
        Text("${counter}"),
        SizedBox(width: 20),
        CounterButton(op: "-", counterPress: decrementCounter),
      ],
    );
  }
}
