import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final String op ; 
  final VoidCallback counterPress; 
  const CounterButton({super.key ,required this.op , required this.counterPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: counterPress,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            op,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
