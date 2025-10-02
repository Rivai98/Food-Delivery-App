import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
class FoodGridItem extends StatelessWidget {
  final FoodItem foodItem; 
  const FoodGridItem({super.key , required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                foodItem.imgUrl,
                width: 100,
                height: 100.0,
              ),
            ),
            Text(
              foodItem.name  ,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 3.0),
            Text(
              "\$ ${foodItem.price}",
              style: TextStyle(color: Colors.deepOrange),
            ),
          ],
        ),
      ),
    );
  }
}
